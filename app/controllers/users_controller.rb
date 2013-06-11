# coding: utf-8
class UsersController < ApplicationController
  authorize_resource
  def index
    @users = User.order(:created_at => :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Студент успешно добавлен"
      redirect_to users_path
    else
      flash[:error] = "Не удалось добавить студента"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Информация о студенте успешно обновлена"
      redirect_to users_path
    else
      flash[:error] = "Не удалось обновить информацию о студенте"
      render :edit
    end
  end

  def show; end

  def destroy
    @user = User.find(params[:id])
    if @user.delete
      flash[:notice] = "Студент успешно удален"
      redirect_to users_path
    else
      flash[:error] = "Не удалось удалить студента"
      redirect_to users_path
    end
  end
end
