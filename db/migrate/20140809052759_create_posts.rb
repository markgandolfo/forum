class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :replies_count, default: 0, null: false
      t.references :user, index: true

      t.timestamps
    end
  end
end
