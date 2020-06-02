Rails.application.config.generators do |g|
  g.test_framework :false
  g.helper false
  g.assets false
  g.view_specs false
end

# Rails.application.config.after_initialize do
#   Bullet.enable = true
#   Bullet.bullet_logger = true
# end