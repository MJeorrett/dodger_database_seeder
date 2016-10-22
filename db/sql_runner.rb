require('pg')

class SqlRunner

  def self.run( sql, strip_results=false )

    begin
      db = PG.connect({ dbname: 'pizza_shop', host: 'localhost' })
      result = db.exec( sql )

    ensure
      if db == nil
        raise "Failed to create database :-("
      end
      db.close

    end

    if strip_results
      return result.map { |a_result| a_result }
    else
      return result
    end

  end

end
