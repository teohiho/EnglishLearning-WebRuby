class CreateWordlists < ActiveRecord::Migration[5.1]
  def change
    create_table :wordlists do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :wordlists, [:user_id, :created_at]
  end
end
