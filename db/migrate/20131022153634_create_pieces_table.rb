class CreatePiecesTable < ActiveRecord::Migration
  def up
    create_table :pieces do |t|
      t.string :orig_title
      t.string :orig_author
      t.text :orig_body
      t.string :title
      t.text :body
      t.integer :user_id
      t.timestamps
    end
  end

  def down
  end
end