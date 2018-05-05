class AddMeanToWordlist < ActiveRecord::Migration[5.1]
  def change
    add_column :wordlists, :mean, :text
  end
end
