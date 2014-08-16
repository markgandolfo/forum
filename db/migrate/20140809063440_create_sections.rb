class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.text :description
      t.integer :order
      t.string "category"

      t.timestamps
    end
  end
end
