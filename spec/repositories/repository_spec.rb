require "rails_helper"

describe Repository , integration: true do
  Given(:repository){ described_class.new }

  describe "score" do
    describe "#all_scores" do
      before{ create_list(:score, 5) }
      Given(:scores){ repository.all_scores }
      Given(:first_scores){ scores.first }
      Then { expect(first_scores).to be_a_kind_of(Biz::Score) }
    end

    describe "#create_score" do
      When(:result){ repository.create_score }
      Then { expect(result).to be_a_kind_of(Biz::Score) }
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

  describe "boss" do
    describe "#all_bosess" do
      before{ create_list(:boss, 5) }
      Given(:bosses){ repository.all_bosses }
      Given(:first_boss){ bosses.first }
      Then { expect(first_boss).to be_a_kind_of(Biz::Boss) }
    end

    describe "#count_bosses" do
      before{ create_list(:boss, 2) }
      When(:result){ repository.count_bosses }
      Then { expect(result).to be_eql 2 }
    end
  end
end
