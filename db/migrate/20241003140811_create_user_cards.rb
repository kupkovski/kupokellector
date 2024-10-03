class CreateUserCards < ActiveRecord::Migration[7.2]
  def change
    create_table :user_cards do |t|
      t.references :card, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
