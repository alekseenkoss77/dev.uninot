# coding: utf-8
class Message < ActiveRecord::Base
 include SmsSender
 attr_accessible :group_id, :body, :user_id, :student_id

 validates  :body, :group_id, presence: true
 
 belongs_to :group      # группа для которой идет рассылка
 belongs_to :user       # отправитель (препод или староста...или админ)
 belongs_to :student    # на всякий случай

 def sms
  p "------"*5
  p self.all_phone_number
  send_sms(self.body, self.all_phone_number)
 end

 def all_phone_number
  number = ''
  self.group.students.each do |student|
    number += student.telephone
    number += ','
  end
  return number.chomp!(",")
 end

end
