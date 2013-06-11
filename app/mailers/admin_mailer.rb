# coding: utf-8
class AdminMailer < ActionMailer::Base
  default :to => User.admins.map(&:email),
          :from => "info@uninot.ru"

  def feedback(obj)
    @obj = obj
    mail(:subject => "uninot.ru feedback")
  end
end