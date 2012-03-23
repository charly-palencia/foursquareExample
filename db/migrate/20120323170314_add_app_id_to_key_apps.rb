class AddAppIdToKeyApps < ActiveRecord::Migration
  def change
    add_column :key_apps, :app_id, :string

  end
end
