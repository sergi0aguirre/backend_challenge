class CreateContactLists < ActiveRecord::Migration
   def self.up
    create_table :contact_lists, :id=>false do |t|
      t.integer  :contact_id
      t.integer  :list_id
      t.timestamps
    end
  end

  def self.down
    drop_table :contact_lists
  end
end
