#Instrucciones

mv system/puma.service /etc/systemd/system/

mv system/nginx.conf /etc/nginx/site-enable/

.env #Cambiar las variables que se usaran en database.yml y puma.rb


yarn add bootstrap@4.5.0 jquery popper.js


#template engine
gem 'slim-rails'

#helper pagination
gem 'kaminari'
gem 'kaminari-i18n'


gem 'stringex
gem 'simple_form'
gem "cocoon"
gem 'html2slim'
gem 'carrierwave'

gem 'devise'
gem "mini_magick"
gem 'faraday

#action background
gem 'sidekiq'
gem "sidekiq-cron"

#notifications
gem 'exception_notification'


#cache redis
gem 'redis-rails'
gem 'redis-store'
gem 'rack-cache'

config.cache_store = :redis_store, "redis://localhost:6379/0/cache", { expires_in: 90.minutes }

gem 'redis-actionpack'

Rails.application.config.session_store :redis_store,
  servers: ["redis://localhost:6379/0/session"],
  expire_after: 90.minutes,
  key: "_#{Rails.application.class.parent_name.downcase}_session",
  threadsafe: true,
  signed: true,
  secure: true


gem 'redis-rack-cache'

config.action_dispatch.rack_cache = {
  metastore: "redis://localhost:6379/1/metastore",
  entitystore: "redis://localhost:6379/1/entitystore"
}

#for frontend framework
gem 'rack-cors'

gem 'httparty'

#Autoload dotenv in Rails.
gem 'dotenv-rails', groups: [:development, :test]
