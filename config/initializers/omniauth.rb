Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, SECRETS['github_key'], SECRETS['github_secret'], scope: 'user'
end
OmniAuth.config.logger = Rails.logger
