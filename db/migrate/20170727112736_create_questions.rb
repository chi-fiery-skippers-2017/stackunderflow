class CreateQuestions < ActiveRecord::Migration
  def change
    create_table  :questions do |t|
      t.string  :title
      t.string  :body
      t.integer :view_count
      t.integer :author_id

      t.timestamps
    end
  end
end
