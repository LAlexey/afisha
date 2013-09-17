# This migration comes from top_list (originally 20130916055853)
class CreateTopListItems < ActiveRecord::Migration
  def change
    create_table :top_list_items do |t|
      t.integer :position
      t.references :positioned, polymorphic: true
      t.string :context

      t.timestamps
    end
  end
end