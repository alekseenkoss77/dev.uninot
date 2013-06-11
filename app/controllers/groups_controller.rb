# coding: utf-8
class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
    authorize! :create, @group
  end

  def create
    @group = Group.new(params[:group])
    authorize! :create, @group
    if @group.save
      flash[:notice] = "Группа успешно добавлена"
      redirect_to groups_path
    else
      flash[:error] = "Не удалось добавить группу"
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
    authorize! :update, @group
  end

  def update
    @group = Group.find(params[:id])
    authorize! :update, @group
    if @group.update_attributes(params[:group])
      flash[:notice] = "Группа успешно обновлена"
      redirect_to groups_path
    else
      flash[:error] = "Не удалось обновить группу"
      render :edit
    end
  end

  def show; end

  def destroy
    @group = Group.find(params[:id])
    authorize! :delete, @group
    if @group.delete
      flash[:notice] = "Группа успешно удалена"
      redirect_to groups_path
    else
      flash[:error] = "Не удалось удалить группу"
      redirect_to groups_path
    end
  end
end
