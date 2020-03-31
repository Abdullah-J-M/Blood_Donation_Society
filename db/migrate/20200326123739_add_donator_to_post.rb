class AddDonatorToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :donator, :string
  end
end
