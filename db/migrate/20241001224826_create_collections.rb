class CreateCollections < ActiveRecord::Migration[7.2]
  def change
    create_table :collections do |t|
      t.string :name, null: false
      t.date :released_at, null: false

      t.timestamps
    end
  end
end
