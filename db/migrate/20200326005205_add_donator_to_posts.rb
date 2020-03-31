class AddDonatorToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :Donator, :string
  end
end
