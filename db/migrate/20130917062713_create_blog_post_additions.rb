class CreateBlogPostAdditions < ActiveRecord::Migration
  def change
    create_table :blog_post_additions do |t|
      t.string :emotions

      t.references :section
      t.references :blog_post
    end
  end
end
