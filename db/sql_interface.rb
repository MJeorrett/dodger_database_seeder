require_relative('sql_builder')
require_relative('sql_runner')

class SqlInterface

  def self.all_records( table_name )
    sql = SqlBuilder.all_records_sql( table_name )
    return SqlRunner.run( sql )
  end

  def self.all_where( table_name, conditions_hash )
    sql = SqlBuilder.all_where_sql( table_name, conditions_hash )
    return SqlRunner.run( sql )
  end

  def self.insert( table_name, values_hash )
    sql = SqlBuilder.insert_sql( table_name, values_hash )
    return SqlRunner.run( sql ).first()['id']
  end

  def self.update( table_name, values_hash, id )
    sql = SqlBuilder.update_sql( table_name, values_hash, id)
    return SqlRunner.run( sql )
  end

  def self.delete_all( table_name )
    sql = SqlBuilder.delete_all_sql( table_name )
    return SqlRunner.run( sql )
  end

  def self.delete_with_id( table_name, id )
    sql = SqlBuilder.delete_with_id_sql( table_name, id )
    return SqlRunner.run( sql )
  end

  def self.many_to_many( table_name, join_column, join_table, other_join_column, other_table )
    sql = SqlBuilder.many_to_many_sql( table_name, join_column, join_table, other_join_column, other_table )
    return SqlRunner.run( sql )
  end

  def self.get_table_columns( table_name )
    sql = SqlBuilder.get_table_columns_sql( table_name )
    return SqlRunner.run( sql )
  end

  def self.find_by_id( table_name, id )
    conditions_hash = { id: id }
    sql = SqlBuilder.all_where_sql( table_name, conditions_hash )
    return SqlRunner.run( sql )
  end

end
