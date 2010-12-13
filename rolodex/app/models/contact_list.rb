class ContactList < ActiveRecord::Base
  belongs_to :list
  belongs_to :contact
  scope :where_ids, lambda { |ids,list_id|  where(["contact_id IN (#{ids}) AND list_id=?",list_id]) }
end
