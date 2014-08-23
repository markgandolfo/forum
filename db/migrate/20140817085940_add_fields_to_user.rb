class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :title, :string
    add_column :users, :homepage, :string
    add_column :users, :dob, :date
    add_column :users, :signature, :text
    add_column :users, :referrer, :string
    add_column :users, :ip_address, :string
    add_column :users, :post_count, :integer
    add_column :users, :biography, :string
    add_column :users, :location, :string
    add_column :users, :sex, :string
    add_column :users, :occupation, :string
    add_column :users, :ride, :string
    add_column :users, :marketing, :string
    add_column :users, :third_party_opt_in, :boolean
    add_column :users, :timezone, :string
    add_column :users, :last_activity, :timestamp
    add_column :users, :last_post, :timestamp
  end
end
