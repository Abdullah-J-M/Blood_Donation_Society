class RenameApplicationsToVolunteers < ActiveRecord::Migration[5.2]
  def change
    rename_table :applications, :volunteers
  end
end
