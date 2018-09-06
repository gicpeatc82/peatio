# main.rb

require 'daemons'
require "logger"

# 在執行的時候先取得當前目錄的絕對路徑

DIR = File.absolute_path(File.dirname(__FILE__))

class TittleDaemon
  def run(name)
    # 修改行程 (Process) 顯示的名稱

    Process.setproctitle(name)

    logger = Logger.new(log_path(name), 'daily')

    loop do
      logger.info "daemon #{name} is running"
      sleep(5)
    end
  end

  def log_path(name)
    File.join(DIR, "#{name}-running.log")
  end
end

class Main
  def start(name)
    options = {
      :ARGV                 => ['start'], # 啟動 daemon

      :backtrace            => true # 如果有發生例外會記錄到 log 中

    }
    Daemons.run_proc(name, options) { TittleDaemon.new.run(name) }
  end

  def stop(name)
    options = {
      :ARGV               => ['stop'], # 停止 daemon

      :backtrace          => true # 如果有發生例外會記錄到 log 中

    }
    Daemons.run_proc(name, options) { TittleDaemon.new.run(name) }
  end
end
