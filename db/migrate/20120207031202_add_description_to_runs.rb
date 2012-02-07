class AddDescriptionToRuns < ActiveRecord::Migration
  def change
    add_column :runs, :description, :text

  end
end
