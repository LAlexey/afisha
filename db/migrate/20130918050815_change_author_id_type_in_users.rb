class ChangeAuthorIdTypeInUsers < ActiveRecord::Migration
  def change
    remove_column :materials, :author_id
    add_column :materials, :author_id, :integer
  end
end
