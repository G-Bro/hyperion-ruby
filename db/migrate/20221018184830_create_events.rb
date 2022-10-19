class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :ref
      t.string :path_part_1
      t.string :path_part_2
      t.string :path_part_3

      t.timestamps
    end
  end
end
