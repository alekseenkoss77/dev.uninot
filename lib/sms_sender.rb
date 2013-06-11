# coding: utf-8
require 'net/http'

module SmsSender 
  def send_sms(text, to, from = "")
    url = URI.parse(URI.escape(Sms::SMS_URL+'?'+"api_id=#{Sms::API_ID}&to=#{to.to_s}&text=#{text.to_s}"))
    result = Net::HTTP.get(url)
    return Sms::SMS_STATUS[result]
  end
end
