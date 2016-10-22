require('pg')

class SqlRunner

  def self.run( sql )

    begin
      db = PG.connect({ dbname: 'pizza_shop', host: 'localhost' })
      result = db.exec( sql )

    ensure
      if db == nil
        raise "Failed to create database :-("
      end
      db.close

    end

    return result
    
  end

end
