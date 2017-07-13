OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "#{ENV["GOOGLE_CLIENT_KEY"]}", "#{ENV["GOOGLE_SECRET_KEY"]}", {
    :name => "google",
    :scope => 
    ['contacts', 'plus.login', 'plus.me', 'plus.profile.emails.read', 'plus.login'],
    :prompt => 'select_account',
    :image_aspect_ration => 'square',
    :image_size => 50,
    :access_type => 'offline'
  } 
end