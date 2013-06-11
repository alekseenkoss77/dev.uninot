# coding: utf-8
class OrdersController < ApplicationController
  authorize_resource

  def index
    @orders = Order.order('created_at desc')
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])
    if @order.save
      AdminMailer.feedback(@order).deliver
      flash[:notice] = "Сообщение отправлено"
      redirect_to root_path
    else
      flash[:error] = "Не удалось отправить сообщение"
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find_by_id(params[:id])
    if @order.delete
      flash[:notice] = "Страница успешно удалена"
      redirect_to orders_path
    else
      flash[:error] = "Не удалось удалить страницу"
      redirect_to orders_path
    end
  end
end
