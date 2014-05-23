# == Schema Information
#
# Table name: groups
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  address           :string(255)
#  time              :string(255)
#  number_of_members :integer
#  created_at        :datetime
#  updated_at        :datetime
#  picture           :string(255)
#  twitter           :string(255)
#  latitude          :float
#  longitude         :float
#  contact           :text
#  activities        :text
#

require 'spec_helper'

describe Group do

  let!(:group) { create(:group) }

  it 'is valid with a name and email' do
    group.name = 'Test Group'
    group.email = 'testgroup@email.com'
    expect(group.valid?).to be_true
  end

  describe 'editable by' do

    let!(:person) { create(:person) }

    it 'is editable by people in the group' do
      person.join!(group)
      expect(group.is_editable_by?(person)).to be_true
    end

    it 'is not editable by people not in the group' do
      expect(group.is_editable_by?(person)).to be_false
    end
  end
end
