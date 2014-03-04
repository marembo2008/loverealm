class SessionsController <  ApplicationController
  def create
    authorization = Authorization.from_omniauth(env["omniauth.auth"])
    session[:user_id] = authorization.uid
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
