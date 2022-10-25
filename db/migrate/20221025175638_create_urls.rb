class CreateUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :urls do |t|
      t.string :host
      t.string :path
      t.string :port
      t.string :query
      t.string :pathPart1
      t.string :string
      t.string :pathPart2
      t.string :pathPart3

      t.belongs_to :event, foreign_key: true

      t.timestamps
    end
  end
end
