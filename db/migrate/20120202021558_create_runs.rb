class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.integer :miles

      t.timestamps
    end
  end
end
