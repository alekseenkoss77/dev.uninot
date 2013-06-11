# coding: utf-8
class MessagesController < ApplicationController
  include SmsSender
  autocomplete :group, :name

  def index
    @messages = Message.order(:created_at => :desc)
    authorize! :read, Message
  end

  def new
    @message = Message.new
    authorize! :create, Message
  end

  def create
    @group = Group.find_by_name(params[:group_id][:group_name])
    @message = Message.new(params[:message])
    authorize! :create, @message
    @message.user_id = current_user.id
    @message.group_id = @group.id
    @desk = Desk.new(
      :group_id => @group.id,
      :title    => "Отправленное СМС сообщение",
      :body     => @message.body,
      :user_id  => current_user.id
    )
    # TODO: разобраться почему не работают 3 &&
    @message.sms
    if @message.save and @desk.save
      flash[:notice] = "Сообщение отправлено, запостено и сохранено успешно"
      redirect_to messages_path
    elsif
      flash[:error] = "Не удалось отправить сообщение"
      render :new
    end
  end

  def destroy
    @message = Message.find(params[:id])
    authorize! :delete, @message
    if @message.delete
      flash[:notice] = "Сообщение успешно удалено"
      redirect_to messages_path
    else
      flash[:error] = "Не удалось удалить сообщение"
      redirect_to messages_path
    end
  end
end
