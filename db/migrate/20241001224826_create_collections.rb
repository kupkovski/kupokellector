class CreateCollections < ActiveRecord::Migration[7.2]
  def change
    create_table :collections do |t|
      t.string :name
      t.datetime :released_at

      t.timestamps
    end
  end
end
