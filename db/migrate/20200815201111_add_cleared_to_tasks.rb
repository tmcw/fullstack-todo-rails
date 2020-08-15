class AddClearedToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :cleared, :boolean
  end
end
