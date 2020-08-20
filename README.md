
**Instrucciones**
     
     
     gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
     
     \curl -sSL https://get.rvm.io | bash -s stable --ruby
     
     gem install erb2slim
     
     erb2slim application.html.erb application.html.slim
     mv application.css application.scss


    mv system/puma.service /etc/systemd/system/
    
    systemctl enable puma.service
    systemctl start puma
    systemctl status puma


    
    mv system/nginx.conf /etc/nginx/site-enable/
    
    .env #Cambiar las variables que se usaran en database.yml y puma.rb

**RUBY GEMSET RVM**

    rvm --create --ruby-version use 2.7.1@app


**Boostrap**

    yarn add bootstrap@4.5.0 jquery popper.js

**PG**

    sudo -u postgres createuser -s supercarlos
    sudo -u postgres psql
    
    \password supercarlos
    \q


**Gemfile**

    #template engine
    gem 'slim-rails'
    
    #helper pagination
    gem 'kaminari'
    gem 'kaminari-i18n'
    
    gem 'stringex
    gem 'simple_form'
    gem 'cocoon'
    gem 'html2slim'
    gem 'carrierwave'
    
    gem 'devise'
    gem 'mini_magick'
    gem 'faraday'
    
    #action background
    gem 'sidekiq'
    gem 'sidekiq-cron'
    
    #notifications
    gem 'exception_notification'
    
    #cache redis
    gem 'redis-rails'
    gem 'redis-store'
    gem 'rack-cache'
    gem 'redis-actionpack'
    gem 'redis-rack-cache'
    
   
    #for frontend framework
    gem 'rack-cors'
    gem 'httparty'
    
    #Autoload dotenv in Rails
    gem 'dotenv-rails', groups: [:development, :test]

**application.rb**

    config.cache_store = :redis_store, "redis://localhost:6379/0/cache", { expires_in: 90.minutes }
      
    config.session_store :redis_store,
          servers: ["redis://localhost:6379/0/session"],
          expire_after: 90.minutes,
          key: "_#{Rails.application.class.parent_name.downcase}_session",
          threadsafe: true,
          signed: true,
          secure: true
    
     config.action_dispatch.rack_cache = {
          metastore: "redis://localhost:6379/1/metastore",
          entitystore: "redis://localhost:6379/1/entitystore"
        }
    

