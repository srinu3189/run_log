class ChangeMilesToFloat < ActiveRecord::Migration
  def up
    change_column :runs, :miles, :float
  end

  def down
  end
end
