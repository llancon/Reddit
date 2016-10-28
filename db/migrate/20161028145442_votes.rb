class Votes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.text :vote
      t.integer :link_id
      t.timestamps
    end
  end
end
