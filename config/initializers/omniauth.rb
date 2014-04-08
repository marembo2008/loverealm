OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '622953651116935', 'ed9344690b2243694edef449d327d1a5', { :scope => "publish_stream, offline_access, email" }
end
