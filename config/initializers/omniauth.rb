Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, SECRETS['github_key'], SECRETS['github_secret']
end
OmniAuth.config.logger = Rails.logger
