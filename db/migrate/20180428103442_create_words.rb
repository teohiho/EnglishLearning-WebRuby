class CreateWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|
      t.string :word
      t.string :mean1
      t.string :mean2
      t.string :mean3
      t.string :mean4
      t.string :mean
      t.integer :status
      t.references :lesson, foreign_key: true

      t.timestamps
    end

    add_index :words, [:lesson_id, :created_at]

  end
end
