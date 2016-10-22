require('minitest/autorun')
require('minitest/rg')

class HtmlTableTest < MiniTest::Test

  def test_two_by_two()
    expected =
"<table>
  <thead>
    <th>column_1</th>
    <th>column_2</th>
  </thead>
  <tr>
    <td>col1_val1</td>
    <td>col2_val1</td>
  </tr>
  <tr>
    <td>col1_val2</td>
    <td>col2_val2</td>
  </tr>
</table>"

    two_by_two_data = [
      {
        'column_1' => 'col1_val1',
        'column_2' => 'col2_val1'
      },
      {
        'column_1' => 'col1_val2',
        'column_2' => 'col2_val2'
      }
    ]
    actual = HtmlTable.generate_table( two_by_two_data )

    assert_equal( expected, actual )
  end

end
