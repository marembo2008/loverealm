module SessionsHelper
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, :notice => "please  sign in" unless signed_in?
    end
  end



  def sign_in(user)
    self.current_user = user
  end

  def sign_out
    session[:user_id] = nil
    self.current_user = nil
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user?(user)
    user == current_user
  end

  def current_user
    @current_user ||=User.find_by_id(session[:user_id])
  end

  def current_user=(user)
    @current_user = user
    if user
      session[:user_id] = user.id
    end
  end
end
