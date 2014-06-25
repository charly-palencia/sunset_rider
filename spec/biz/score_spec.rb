require "spec_helper"
require "./app/models/biz/score"

describe Biz::Score do
  describe "#calculator" do
    Given(:score){ Biz::Score.new({}) }
    Then{ expect(score.calculator).to be_a_kind_of(Biz::ScoreCalculator) }
  end

  describe "#total" do
    before{ allow_any_instance_of(Biz::ScoreCalculator).to receive(:total){ 1 } }
    Given(:score){ Biz::Score.new({}) }
    Then{ expect(score.total).to eql 1 }
  end
end
