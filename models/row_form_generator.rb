require_relative('./html_element')

class RowFormGenerator

  def self.generate_new_for_table( db_name, table_name )
    columns_data = Database.columns_for_table( db_name, table_name )
    inputs = {}

    columns_data.each do |column_data|

      column_name = column_data['column_name']

      case column_data['data_type']
      when :int
        atts = {
          type: "numeric",
          name: column_name,
          required: :boolean,
          min: "0",
          step: "1",
          class: 'new-form-input'
        }
        input = HtmlElement.new( 'input', "", atts )

      when :float
        atts = {
          type: "numeric",
          name: column_name,
          required: :boolean,
          min: "0",
          step: "any",
          class: 'new-form-input'
        }
        input = HtmlElement.new( 'input', "", atts )

      when :string
        atts = {
          type: "text",
          name: column_name,
          required: :boolean,
          class: 'new-form-input'
        }
        input = HtmlElement.new( 'input', "", atts )

      when :bool
        true_option = HtmlElement.new( 'option', "true", { value: "t" } )
        false_option = HtmlElement.new( 'option', "false", { value: "f" } )
        input = HtmlElement.new( 'select', [true_option, false_option], { name: column_name, class: 'new-form-input' } )

      when :date
        atts = {
          type: "date",
          name: column_name,
          required: :boolean,
          class: 'new-form-input'
        }
        input = HtmlElement.new( 'input', "", atts )

      when :ref
        values = Database.referenced_values_for_column( db_name, table_name, column_name )

        options = values.map do |value|
          HtmlElement.new( 'option', value, { value: value } )
        end

        input = HtmlElement.new( 'select', options, { name: column_name, class: 'new-form-input' } )

      end

      inputs[column_name] = input

    end

    inputs['id'] = ""
    submit_atts = {
      type: 'submit',
      value: "Create",
      id: 'new-form-create'
    }
    inputs['submit'] = HtmlElement.new( 'input', "", submit_atts )

    return inputs

  end

end
