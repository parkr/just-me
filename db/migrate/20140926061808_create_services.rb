class CreateServices < ActiveRecord::Migration[4.2]
  def change
    create_table :services do |t|
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
