class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :title
      t.text :body
      t.references :post, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
