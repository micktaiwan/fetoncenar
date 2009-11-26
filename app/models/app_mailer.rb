class AppMailer < ActionMailer::Base
  
  def alert(title, msg)
    @subject    = '[Swap] ' + title
    @body["msg"] = msg
    @recipients = 'faivrem@gmail.com'
    @from       = 'protask@protaskm.com'
    @sent_on    = Time.now
    @headers    = {}
  end
  
  def message(m, recipients)
    @subject    = "[Swap!] Message from #{m.user.name}"
    @body["m"] = m
    @recipients = recipients
    @from       = m.user.email
    @sent_on    = Time.now
    @headers    = {}
    content_type "text/html"
  end
  
end

