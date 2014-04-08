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
    @message = '';
    if signed_in?
      @message= "Already signed in"
      respond_to do |format|
        format.js {render "info/message"}
      end
      return
    end
    auth = request.env['omniauth.auth']
    if auth
      #sign in normally via facebook
      data = request.env['omniauth.auth'].extra.raw_info
      unless @auth = Authorization.from_omniauth(env["omniauth.auth"])
        puts "create auth from hash"
        @auth = Authorization.create_from_hash(auth,current_user,data)
      end
      puts "authorization #{@auth}"
      puts "user id from authoriztion #{@auth.uid}"
      @user = User.find_by_uid(@auth.uid);
      sign_in(@user)
      redirect_to "/users/#{@user.email}/dashboard"
    else
      #sign in normally via email/password
      user = User.find_by_email(params[:session][:email])
      if user &&  user.authenticate(params[:session][:password]) #user.validated &&
        sign_in(user)
        @message= "#{user.fullname} you have successfully signed, please wait...."
      else
	      @message = "signed in fail"
      end
	    respond_to do |format|
        format.js {render "info/signed_in_message"}
      end
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
