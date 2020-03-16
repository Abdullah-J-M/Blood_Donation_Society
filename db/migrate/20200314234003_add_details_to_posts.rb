class AddDetailsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :telephone, :string
    add_column :posts, :requester, :string
    add_column :posts, :bloodtype, :string
  end
end
