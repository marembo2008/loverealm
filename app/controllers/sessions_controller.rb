class SessionsController <  ApplicationController
  def create_fb
   @env_auth = env["omniauth.auth"]
   if @env_auth
    authorization = Authorization.from_omniauth(env["omniauth.auth"])
    session[:auth_uid] = authorization.uid
   else
  puts "Direct login"
   end

    redirect_to root_url
  end



  def create
    if signed_in?
#      redirect_to "/users/#{current_user.html_safe_username}/feed"
puts "Already signed in"
      return
    end
    auth = request.env['omniauth.auth']
    if auth
      #sign in normally via facebook
      data = request.env['omniauth.auth'].extra.raw_info
      unless @auth = Authorization.from_omniauth(env["omniauth.auth"])
        @auth = Authorization.create_from_hash(auth,current_user,data)
      end
      sign_in(@auth.user)
      redirect_to "/users/#{user.html_safe_username}" && return
    else
      #sign in normally via email/password
      user = User.find_by_email(params[:session][:email])
	message = ""
      if user &&  user.authenticate(params[:session][:password]) #user.validated &&
        sign_in(user)
        puts "signed in user: #{user.email}"
      else
	puts "signin failed"
	message = "fail"
      end
	respond_to do |format|
	      format.js {render :json => message.to_json}
	   end
    end
  end


  def destroy
    sign_out
    redirect_to root_url
  end

end
