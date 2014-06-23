require "spec_helper"
require "./app/models/biz/score_calculator"

describe Biz::ScoreCalculator do
  Given(:bosses){ [double({points: 300})] }
  Given(:bosses_total) { bosses.inject(0){ |sum, n| sum + n.points } }
  Given(:enemies_killed_total) { score.enemies_killed }
  Given(:score){ double({name: "Jhon Doe", enemies_killed: 50, bosses: bosses}) }
  When(:score_calculator){ described_class.new(score) }

  describe "#total" do
    When(:result){ score_calculator.total }
    Then{ expect(result).to eql(bosses_total + enemies_killed_total) }
  end

  describe "#total_percent" do
    Given(:bosses_count){ 5 }
    When(:result){ score_calculator.total_percent(bosses_count)}
    Then{ expect(result).to eql((bosses.count/bosses_count.to_f)*100) }
  end
end
