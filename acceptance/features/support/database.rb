require 'mysql'

module DbSupport

  def close_connection
    @connection.close
    @connection = nil
  end

  def connection
    begin
      @connection ||= Mysql.connect(CONFIG_SETTING['database_url'].match(/\/\/(.+)\//)[1],
                                    CONFIG_SETTING['database_user'],
                                    CONFIG_SETTING['database_password'],
                                    CONFIG_SETTING['database_url'].match(/\/\/.+\/(.+)$/)[1])
    rescue Interrupt, Errno::EINTR
      puts 'mysql running failed'
    end
  end

  def guarantee_sql_execute
    begin
      results = yield connection
    rescue Interrupt, Errno::EINTR
      close_connection
    end
    results
  end

end

World(DbSupport)
