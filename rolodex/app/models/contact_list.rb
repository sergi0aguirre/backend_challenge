class ContactList < ActiveRecord::Base
  belongs_to :list
  belongs_to :contact
  validate :validate_pair
  scope :where_ids, lambda { |ids,list_id|  where(["contact_id IN (#{ids}) AND list_id=?",list_id]) }

  def validate_pair
    if ContactList.count(:conditions => ["contact_id = ? and list_id = ?", contact_id, list_id]) > 0
      errors.add_to_base("...")
    end
  end

end
