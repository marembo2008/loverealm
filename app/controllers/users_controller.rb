class UsersController < ApplicationController
require 'realm_util'
include RealmUtil
include SessionsHelper

  before_filter :signed_in_user, :only => [:edit,:update,:index, :following, :followers]
  before_filter :correct_user, :only => [:edit,:update]

  def index
  end

  def show
     @user = User.find(params[:id])
   #inbox, notifications, lovescore
  end

  def edit
  @user = current_user
  end

  def update
      if @user.update(user_params)
puts "update success"
      else
      puts "update failed"
      end
redirect_to "/details"
  end

  def feed
      @articles = @user.feed
   end

  def following
	@user = User.find(params[:id])
	@users = @user.followed_users
  end

  def following
	@user = User.find(params[:id])
	@users = @user.followers
  end

  def create
      params[:user]['validated'] = 'false'
    validation_code = getRandomString #random regex
    params[:user]['validation_code'] = validation_code
    is_saved = false
	puts "validation code #{validation_code}"
    @user = User.new(user_params)
    begin
      is_saved = @user.save
    rescue => error
      puts error
    end
    message = " "
    if is_saved
      url = request.host_with_port
      send_verification_email(url, @user)
puts "User saved #{@user.email}"
      message = "success"
    else
puts "Saving user failed"
     message = "failed: "
      message = message + @user.errors.full_messages[0]
    end
    respond_to do |format|
      format.js {render :json => message.to_json}
    end

  end

def validateemail
    validation_code = params[:code]
    @user = User.find_by_validation_code(validation_code)
    if @user
 #     @user.update_attribute("validation_code","")
 #     @user.update_attribute("validated",true)
     sign_in(@user)
puts "User has verified"
#redirect_to "/details"
else
puts "FAILED -- verification"
    end
    redirect_to "/details" #update details page
  end


private

 def user_params
    params.require(:user).permit(:email,:password,:password_confirmation, :validated, :validation_code, :fname, :lname)
 end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end
