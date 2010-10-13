class CreatePhoneNumbers < ActiveRecord::Migration
  def self.up
    create_table :phone_numbers do |t|
      t.integer :contact_id
      t.string :area_code
      t.string :number
      t.integer :phone_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :phone_numbers
  end
end
