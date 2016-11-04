require('pg')

class SqlRunner

  def self.run( dname, sql, strip_results=false )

    begin

      if ENV['DATABASE_URL'] == nil
        db = PG.connect({ dbname: dname, host: 'localhost' })
      else
        uri = URI.parse( ENV['DATABASE_URL'] )
        db = PG.connect( dbname: uri.path[1..-1], host: uri.host, user: uri.user, password: uri.password )
      end
      
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
