class CreateTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :taggings do |t|
      t.integer :link_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
