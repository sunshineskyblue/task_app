class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title, null:false
      t.datetime :day_start, null:false
      t.datetime :day_end, null:false
      t.boolean :day_all
      t.string :memo

      t.timestamps
    end
  end
end
