class SessionsController <  ApplicationController
  def create
    authorization = Authorization.from_omniauth(env["omniauth.auth"])
    session[:auth_uid] = authorization.uid
    redirect_to root_url
  end

  def destroy
    session[:auth_uid] = nil
    redirect_to root_url
  end

end
