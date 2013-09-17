class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :title
      t.text :description
      t.datetime :publication_date
      t.string :type
      t.string :author_id, limit: 24 # mongoId ObjectId

      #t.integer :additional_id
      #t.string  :additional_type, :limit => 30
      t.timestamps
    end

    add_index :materials, :type
    add_index :materials, :author_id
    #add_index :materials, [:additional_id, :additional_type]
  end
end
