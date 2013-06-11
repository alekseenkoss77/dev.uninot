module ApplicationHelper
  def human_date(date, format="%d %B %y, %H : %M")
    Russian.strftime(date,format)
  end
  
  def required_filed
    raw "<span class='red'>*</span>"
  end
end
