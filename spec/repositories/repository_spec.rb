require "rails_helper"

describe Repository , type: :integration do

  describe "#create_score" do
    Given(:repository){ described_class.new }
    When(:result){ repository.create_score }
    Then { expect(result).to be_a_kind_of(Biz::Score) }
    And { expect(result.data).to be_a_kind_of(Score) }
  end
end
