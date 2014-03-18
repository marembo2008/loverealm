require 'realm_util'
include RealmUtil
include SessionsHelper

class UsersController < ApplicationController

  before_filter :signed_in_user, :only => [:edit,:update,:index, :following, :followers]
  before_filter :correct_user, :only => [:edit,:update]
  
  def index
  end

  def feed
    @articles = @user.feed
  end

  def following
    @user = User.find(params[:id])
    @users = @user.followed_users
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followers
  end
  
  def dashboard
    @user = User.find_by_email(params[:id]);
    current_user = @user
  end

  def create
    params[:user]['validated'] = 'false'
    validation_code = getRandomString #random regex
    params[:user]['validation_code'] = validation_code
    is_saved = false
	  puts "validation code #{validation_code}"
    @user = User.new(user_params)
    puts "user: #{@user}"
    begin
      is_saved = @user.save
    rescue => error
      puts error
    end
    @message = " "
    if is_saved
      url = request.host_with_port
      send_verification_email(url, @user)
      puts "User saved #{@user.email}"
      @message = "Thank you for registering to loverealm.org. Please see your email for further instructions"
    else
      puts "Saving user failed"
      @message = "Registration has failed. "
      @message = @message + @user.errors.full_messages[0] if @user.errors.full_messages[0]
    end
    respond_to do |format|
      format.js {render "info/message"}
    end
  end

  def validateemail
    validation_code = params[:code]
    @user = User.find_by_validation_code(validation_code)
    #TODO (kennmunene@gmail.com) please update this logic. need to tell whether email is validated or not whenever going to dashboard
    if @user
      #@user.update_attribute("validation_code","")
      #@user.update_attribute("validated",true)
      sign_in(@user)
      puts "User has verified"
    else
      puts "FAILED -- verification"
    end
    redirect_to "/user/dashboard" #update details page
  end

private

 def user_params
    params.require(:user).permit(:email,:password,:password_confirmation, :validated, :validation_code)
 end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end
