class AddSectionIdToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :section, index: true
  end
end
