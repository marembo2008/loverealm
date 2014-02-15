class BasicCredential < AbstractCredential
 attr_accessor :email, :password

 validates :email, presence: true, confirmation: true, uniqueness: {case_sensitive: false}
 validates :password, presence: true, format: {with: /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/, message: "must be at least 6 characters and include one number and one letter."}
 validates :confirm_password, presence: true
 has_secure_password

end
