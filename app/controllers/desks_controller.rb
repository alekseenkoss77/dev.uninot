# coding: utf-8
class DesksController < ApplicationController
  autocomplete :group, :name

  def index
    @desks = Desk.all
  end

  def desk
    if params[:group]
      group = Group.find_by_name(params[:group][:group_name])
      @desks = Desk.find_all_by_group_id(group.id, :order => "created_at desc") if group
    end
  end

  def new
    @desk = Desk.new
    authorize! :create, @desk
  end

  def create
    @group = Group.find_by_name(params[:group_id][:group_name])
    @desk = Desk.new(params[:desk])
    @desk.user = current_user
    @desk.group_id = @group.id
    authorize! :create, @desk    
    @message = Message.create!(
      :group_id => @group.id,
      :body     => "Новое сообщение для Вашей группы",
      :user_id  => current_user.id
    )
    if @desk.save
      @message.sms
      flash[:notice] = "Пост успешно добавлен"
      redirect_to desks_path
    else
      flash[:error] = "Не удалось добавить пост"
      render :new
    end
  end

  def edit
    @desk = Desk.find(params[:id])
    authorize! :update, @desk
  end

  def update
    @group = Group.find_by_name(params[:group_id][:group_name])
    @desk = Desk.find(params[:id])
    @desk.group_id = @group.id
    authorize! :update, @desk
    if @desk.update_attributes(params[:desk])
      flash[:notice] = "Пост обновлен успешно"
      redirect_to desks_path
    else
      flash[:error] = "Не удалось обновить пост"
      render :edit
    end
  end

  def show; @desk = Desk.find(params[:id]); end

  def destroy
    @desk = Desk.find(params[:id])
    authorize! :delete, @desk
    if @desk.delete
      flash[:notice] = "Пост успешно удален"
      redirect_to desks_path
    else
      flash[:error] = "Не удалось удалить пост"
      redirect_to desks_path
    end
  end
end
