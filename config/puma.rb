# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
#
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
#
port        ENV.fetch("PORT") { 3000 }

# Specifies the `environment` that Puma will run in.
#
environment ENV.fetch("RAILS_ENV") { "development" }


# アプリケーションがあるディレクトリと各種ファイルを生成するディレクトリを指定する
# tmpディレクトリは存在していないが、手動で作成するか起動時のスクリプトで作成するようにする
#  socketやlogやpidファイルを格納するディレクトリも存在していないので手動かスクリプトで作成
#  存在しないと起動出来ずに落ちます
# app_dir = File.expand_path("../..", __FILE__)
# tmp_dir = "#{app_dir}/tmp"

# 環境変数を指定する。起動時に変数があればそれを見る。無ければテスト環境である"staging"としている
# rails_env = ENV['RAILS_ENV'] || "staging"
# environment rails_env

# socketでbindする。nginxからsocket経由で接続するため
# bind "unix://home/ubuntu/SucSeed/tmp/sockets/puma.sock"l

# ログ出力ファイルの指定
# stdout_redirect "#{tmp_dir}/logs/puma.stdout.log", "#{tmp_dir}/logs/puma.stderr.log", true

# pidとstateファイルの格納
# pidfile "#{tmp_dir}/pids/puma.pid"
# state_path "#{tmp_dir}/pids/puma.state"

#

# Specifies the number of `workers` to boot in clustered mode.
# Workers are forked webserver processes. If using threads and workers together
# the concurrency of the application would be max `threads` * `workers`.
# Workers do not work on JRuby or Windows (both of which do not support
# processes).
#
# workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory.
#
# preload_app!

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
