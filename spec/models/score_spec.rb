require 'rails_helper'

describe Score do
  # it { should validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:name)}
  # it { should validate_presence_of(:enemies_killed) }
  it { is_expected.to validate_presence_of(:enemies_killed)}

  # not matcher exist for dm-rspec
  # it { should validate_numericality_of(:enemies_killed) }


  # it { should  have_and_belong_to_many(:bosses) }
  it { is_expected.to  have_many_and_belong_to(:bosses) }
end
