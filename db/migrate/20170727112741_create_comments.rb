class CreateComments < ActiveRecord::Migration
  def change
    create_table  :comments do |t|
      t.string  :body
      t.string  :commentable_type
      t.integer :commentable_id
      t.integer :author_id

      t.timestamps
    end
  end
end
