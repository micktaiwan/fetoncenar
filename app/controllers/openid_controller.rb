class OpenidController < ApplicationController

  def associate_login
    @iurl = params[:iurl]
  end

  def associate
    @iurl = params[:iurl]
    u = User.authenticate(params['user']['email'], params['user']['password'])
    if u
      session['user'] = u.id
      #u.last_login = Time.now
      u.identity_url = @iurl
      u.save
      # send an email to admin
      # AppMailer.deliver_alert("Login Alert","#{session['user']['name']} just logged on Movies")
      flash['notice']  = "Login successful"
      redirect_back_or_default :controller => "welcome"
    else
      @login    = params['user_login']
      @message  = "Login unsuccessful"
      redirect_to("associate_login?url=#{@iurl}")
    end
  end

end
