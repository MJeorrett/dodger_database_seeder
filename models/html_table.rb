require_relative('./html_element')

class HtmlTable

  def self.generate_table( data, column_names=nil )

    if column_names.nil?
      column_names = data.first.keys
    end

    th_elements = column_names.map do |column|
      th_element = HtmlElement.new( 'th', column )
      th_element
    end

    thead_row = HtmlElement.new( 'tr', th_elements, { class: 'header-row'} )
    thead = HtmlElement.new( 'thead', thead_row )

    tr_elements = data.map do |row|
      td_elements = row.values.map do |value|
        if value.class.to_s == 'HtmlElement' && value.tag == 'a'
          td_attributes = { class: 'link-cell'}
          td_element = HtmlElement.new( 'td', value, td_attributes )
        else
          td_element = HtmlElement.new( 'td', value )
        end

        td_element
      end

      tr_element = HtmlElement.new( 'tr', td_elements )
    end

    table_contents = [ thead ] + tr_elements
    table = HtmlElement.new( 'table', table_contents )
    return table.to_s
  end

end
