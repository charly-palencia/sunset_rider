require "spec_helper"
require "./app/models/biz/score"

describe Biz::Score do
  describe "#calculator" do
    Given(:score){ Biz::Score.new({}) }
    Then{ expect(score.calculator).to be_a_kind_of(Biz::ScoreCalculator) }
  end
end
