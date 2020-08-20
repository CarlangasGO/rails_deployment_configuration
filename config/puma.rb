max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

environment ENV.fetch("RAILS_ENV") { "development" }

app = ENV.fetch("APP_NAME")

app_path = ENV.fetch("APP_PATH_UNIX")

pidfile "#{app_path}/puma_#{app}.pid"

state_path "#{app_path}/puma_#{app}.state"

stdout_redirect "/var/www/#{app}/log/puma_#{app}.log", "/var/www/#{app}/log/puma_err_#{app}.log"

bind "unix:#{app_path}/puma_#{app}.sock"

workers 4

activate_control_app "unix:#{app_path}/pumactl_#{app}.sock"

plugin :tmp_restart
