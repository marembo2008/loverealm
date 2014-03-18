class UserMailer < ActionMailer::Base
  default :from => "marembo@loverealm.org"
  def send_verification_code(url,user)
    message = "Thank you for joining loverealm,
            <a href = 'http://#{url}/users/validateemail?code=#{user.validation_code}'>
            click this link</a>
           to verify your email address and join our community"
    to =user.email
    mail(:to => to,
      :subject=> "verify email address: loverealm.org ",
      :content_type => "text/html",
      :body => message)
  end

end
