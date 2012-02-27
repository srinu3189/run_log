class AddDateToRuns < ActiveRecord::Migration
  def change
    add_column :runs, :date, :date

  end
end
