class CreateUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :urls do |t|
      t.string :host
      t.string :path
      t.string :port
      t.string :query
      t.string :path_part_1
      t.string :path_part_2
      t.string :path_part_3

      t.belongs_to :event, foreign_key: true

      t.timestamps
    end
  end
end
