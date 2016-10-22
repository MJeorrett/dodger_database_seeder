require_relative('./html_element')

class HtmlTable

  def self.generate_table( data )

    th_elements = data.first.keys.map do |column|
      HtmlElement.new( 'th', column )
    end

    thead = HtmlElement.new( 'thead', th_elements )

    tr_elements = data.map do |row|

      td_elements = row.values.map do |value|
        HtmlElement.new( 'td', value )
      end

      tr_element = HtmlElement.new( 'tr', td_elements )
    end

    table_contents = [ thead ] + tr_elements
    table = HtmlElement.new( 'table', table_contents )
    return table.to_s
  end

end
