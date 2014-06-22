require 'rails_helper'

describe Score do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:enemies_killed) }
  it { should validate_numericality_of(:enemies_killed) }


  it { should  have_and_belong_to_many(:bosses) }
end
