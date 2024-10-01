class CreateCards < ActiveRecord::Migration[7.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :collection_number

      t.timestamps
    end
  end
end
