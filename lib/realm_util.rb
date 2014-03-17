module RealmUtil

  def  send_verification_email(url, user)
    m = UserMailer::send_verification_code(url, user)
    m.deliver
  end

  def getRandomString
    o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
    string  =  (0...50).map{ o[rand(o.length)] }.join
  end

end
