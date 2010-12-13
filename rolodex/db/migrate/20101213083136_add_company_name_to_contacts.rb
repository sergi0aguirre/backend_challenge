class AddCompanyNameToContacts < ActiveRecord::Migration
   def self.up
    add_column :contacts, :company_name, :string
  end

  def self.down
    remove_column :contacts, :company_name
  end
end
