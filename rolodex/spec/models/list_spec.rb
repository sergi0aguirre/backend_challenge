require 'spec_helper'

describe List do
  before(:each) do
    @contact = Factory(:list)
  end

  it { should belong_to(:user) }
  it { should validate_presence_of(:name) }
  it { should have_many(:contacts).through(:contact_lists) }
end
