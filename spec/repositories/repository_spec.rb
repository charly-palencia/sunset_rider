require "rails_helper"

describe Repository , type: :integration do
  Given(:repository){ described_class.new }

  describe "#create_score" do
    When(:result){ repository.create_score }
    Then { expect(result).to be_a_kind_of(Biz::Score) }
    And { expect(result.data).to be_a_kind_of(Score) }
  end

  describe "#save_score" do
    context "with valid data" do
      Given(:param){ {name: "name", enemies_killed: 2} }
      Given(:score){ Biz::Score.new(Score.new(param)) }
      When(:result){ repository.save_score(score) }
      Then{ expect(score.errors).to be_empty }
      And{ expect(score.id).to_not be_nil }
      And{ expect(result).to be true}
    end

    context "with invalid data" do
      Given(:param){ {name: "name", enemies_killed: "asd"} }
      Given(:score){ Biz::Score.new(Score.new(param)) }
      When(:result){ repository.save_score(score) }
      Then{ expect(score.errors).to_not be_empty }
      And{ expect(score.id).to be_nil }
      And{ expect(result).to be false }
    end
  end
end
