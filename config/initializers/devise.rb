Devise.setup do |config|
  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"
  require "devise/orm/active_record"
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 12
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..50
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 2.hours
  config.sign_out_via = :delete
  config.scoped_views = true
  Devise::TRUE_VALUES << ["on"]
  config.remember_for = 2.weeks
  config.omniauth :github, ENV["client_id"], ENV["client_secret"],
    scope: "user:email, user:follow, repo, read:org"
end
