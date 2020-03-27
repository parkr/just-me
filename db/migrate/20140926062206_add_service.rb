class AddService < ActiveRecord::Migration[4.2]
  def change
    add_column :services, :user_id, :string
  end
end
