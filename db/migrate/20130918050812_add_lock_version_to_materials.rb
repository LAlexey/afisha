class AddLockVersionToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :lock_version, :integer
  end
end
