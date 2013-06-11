# coding: utf-8
class StudentsController < ApplicationController
  def index
    @students = Student.order(:name)
    authorize! :read, @students
  end

  def import
    Student.import(params[:file])
    flash[:notice] = "Файл успешно импортирован"
    redirect_to students_url
  end

  def new
    @student = Student.new
    authorize! :create, @student
  end

  def create
    @student = Student.new(params[:student])
    authorize! :create, @student
    if @student.save
      flash[:notice] = "Студент успешно добавлен"
      redirect_to students_path
    else
      flash[:error] = "Не удалось добавить студента"
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
    authorize! :update, @student
  end

  def update
    @student = Student.find(params[:id])
    authorize! :create, @student
    if @student.update_attributes(params[:student])
      flash[:notice] = "Информация о студенте успешно обновлена"
      redirect_to students_path
    else
      flash[:error] = "Не удалось обновить информацию о студенте"
      render :edit
    end
  end

  def show; end

  def destroy
    @student = Student.find(params[:id])
    authorize! :delete, @student
    if @student.delete
      flash[:notice] = "Студент успешно удален"
      redirect_to students_path
    else
      flash[:error] = "Не удалось удалить студента"
      redirect_to students_path
    end
  end
end
