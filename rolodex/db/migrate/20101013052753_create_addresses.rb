class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.integer :contact_id
      t.string :address
      t.string :zip
      t.string :city
      t.string :state
      t.string :country
      t.integer :address_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
