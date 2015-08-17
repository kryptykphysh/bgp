class BloodTest < ActiveRecord::Base
  def self.index_chart
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('datetime', 'Date')
    data_table.new_column('number', 'BGL')
    data_table.add_rows(BloodTest.all.map(&:to_data_table_row))
    option = {
      width: '80%',
      height: 400,
      title: 'BGL over Time',
      vAxis: {
        title: 'BGL'
      },
      hAxis: {
        title: 'Time',
        format: 'yyy-MM-dd HH:mm'
      }
    }
    GoogleVisualr::Interactive::LineChart.new(data_table, option)
  end

  def to_data_table_row
    [Time.parse(created_at.localtime.strftime('%Y-%m-%d %H:%M:%S')), bgl]
  end
end
