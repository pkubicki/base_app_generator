smtp = SETTINGS.smtp
ActionMailer::Base.smtp_settings = {  
  :address              => smtp.address,
  :port                 => smtp.port,  
  :domain               => smtp.domain,
  :user_name            => smtp.user_name,
  :password             => smtp.password,
  :authentication       => smtp.authentication,
  :enable_starttls_auto => smtp.enable_starttls_auto
}
