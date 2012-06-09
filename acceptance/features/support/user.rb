module User

  def has_user_like? where_condition
    results = guarantee_sql_execute do |connection|
      connection.query("SELECT 1 FROM users WHERE #{where_condition}")
    end

    results.count > 0
  end

end

World(User)