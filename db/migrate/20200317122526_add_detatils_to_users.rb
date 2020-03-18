class AddDetatilsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :bloodtype, :string
    add_column :users, :telephone, :string
  end
end
