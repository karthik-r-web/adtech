# config/puma.rb

# Number of Puma workers (equal to CPU cores is a good start)
workers Integer(ENV.fetch("WEB_CONCURRENCY") { 2 })

# Threads per worker (min/max)
threads_count = Integer(ENV.fetch("RAILS_MAX_THREADS") { 5 })
threads threads_count, threads_count

# Run in production by default
environment ENV.fetch("RAILS_ENV") { "production" }

# Directory for app
app_dir = File.expand_path("../..", __FILE__)

# Ensure tmp directories exist
directory app_dir
pidfile "#{app_dir}/tmp/pids/puma.pid"
state_path "#{app_dir}/tmp/pids/puma.state"

# 🔥 Use only UNIX socket (for nginx reverse proxy)
bind "unix://#{app_dir}/tmp/sockets/puma.sock"

# Logging
stdout_redirect "#{app_dir}/log/puma.stdout.log", "#{app_dir}/log/puma.stderr.log", true

# Allow phased restarts (zero-downtime)
plugin :tmp_restart

# Preload app for performance
preload_app!

