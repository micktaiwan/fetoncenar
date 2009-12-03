# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  def new
  end

  def create
    logout_keeping_session!
    user = User.authenticate(params[:email], params[:password])
    if user
      AppMailer.deliver_alert("#{user.email} logged in", "#{user.email} logged in")
      # Protects against session fixation attacks, causes request forgery
      # protection if user resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset_session
      self.current_user = user
      new_cookie_flag = (params[:remember_me] == "1")
      handle_remember_cookie! new_cookie_flag
      redirect_back_or_default('/scripts/my')
      flash[:notice] = "Logged in successfully"
    else
      note_failed_signin
      @email       = params[:email]
      @remember_me = params[:remember_me]
      render :action => 'new'
    end
  end

  def destroy
    logout_killing_session!
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end

  def openid
    open_id_authentication
  end

protected
  # Track failed login attempts
  def note_failed_signin
    flash[:error] = "Couldn't log you in as '#{params[:email]}'"
    logger.warn "Failed login for '#{params[:email]}' from #{request.remote_ip} at #{Time.now.utc}"
  end

private

  def open_id_authentication
    authenticate_with_open_id do |result, identity_url|
      if result.successful?
        if @current_user = User.find_by_identity_url(identity_url)
          successful_login
        else
          redirect_to("/openid/associate_login?iurl=#{identity_url}")
        end
      else
        failed_login result.message
      end
    end  
  end
  
  def successful_login
    self.current_user = @current_user
    redirect_to("/scripts/my")
  end

  def failed_login(message)
    flash[:error] = message
    redirect_to("/login")
  end

end

