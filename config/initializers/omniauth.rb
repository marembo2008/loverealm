OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1543674275857236', '9bea59d160ea06b57698821c2045a81d'
end
