class AddLastBloodDonatedDateToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_donated_date, :date
  end
end
