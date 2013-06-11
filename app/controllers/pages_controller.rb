# coding: utf-8
class PagesController < ApplicationController
  def index
    @pages = Page.order(:name)
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = "Страница успешно добавлена"
      redirect_to pages_path
    else
      flash[:error] = "Не удалось добавить страницу"
      render :new
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:notice] = "Страница успешно обновлена"
      redirect_to pages_path
    else
      flash[:error] = "Не удалось обновить страницу"
      render :edit
    end
  end

  def show
    @page = Page.find_by_slug!(params[:slug])
  end

  def destroy
    @page = Page.find_by_slug(params[:slug])
    if @page.delete
      flash[:notice] = "Страница успешно удалена"
      redirect_to pages_path
    else
      flash[:error] = "Не удалось удалить страницу"
      redirect_to pages_path
    end
  end
end
