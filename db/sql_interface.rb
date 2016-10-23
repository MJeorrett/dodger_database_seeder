require_relative('sql_builder')
require_relative('sql_runner')

class SqlInterface

  def self.all_records( db_name, table_name )
    sql = SqlBuilder.all_records_sql( table_name )
    return SqlRunner.run( db_name, sql, true )
  end

  def self.all_where( db_name, table_name, conditions_hash )
    sql = SqlBuilder.all_where_sql( table_name, conditions_hash )
    return SqlRunner.run( db_name, sql, true )
  end

  def self.insert( db_name, table_name, values_hash )
    sql = SqlBuilder.insert_sql( table_name, values_hash )
    return SqlRunner.run( db_name, sql, true ).first()['id']
  end

  def self.update( db_name, table_name, values_hash, id )
    sql = SqlBuilder.update_sql( table_name, values_hash, id)
    return SqlRunner.run( db_name, sql, true )
  end

  def self.delete_all( db_name, table_name )
    sql = SqlBuilder.delete_all_sql( table_name )
    return SqlRunner.run( db_name, sql, true )
  end

  def self.delete_with_id( db_name, table_name, id )
    sql = SqlBuilder.delete_with_id_sql( table_name, id )
    return SqlRunner.run( db_name, sql, true )
  end

  def self.many_to_many( db_name, table_name, join_column, join_table, other_join_column, other_table )
    sql = SqlBuilder.many_to_many_sql( table_name, join_column, join_table, other_join_column, other_table )
    return SqlRunner.run( db_name, sql, true )
  end

  def self.get_table_columns( db_name, table_name )
    sql = SqlBuilder.get_table_columns_sql( table_name )
    return SqlRunner.run( db_name, sql, true )
  end

  def self.find_by_id( db_name, table_name, id )
    conditions_hash = { id: id }
    sql = SqlBuilder.all_where_sql( table_name, conditions_hash )
    return SqlRunner.run( db_name, sql, true )
  end

end
