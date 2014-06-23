require "spec_helper"
require "app/models/biz/score"
require "app/models/biz/boss"
require "app/runners/runner"

describe Runner, unit: true do
  Given(:context){ double("context", success: true) }
  Given(:score){ double(name: "Jhon Doe") }
  Given(:callback){ lambda {|success, element|} }
  Given(:runner){ Runner.new(context, repo) }

  describe "Score" do
    describe "#save_score" do
      Given(:params){ { name: "jhon Doe"} }

      context "when information is valid" do
        Given(:repo){ double(create_score: score, save_score: true) }
        Given{ allow(score).to receive(:errors){ [] }  }

        When{ runner.save_score(params, &callback) }
        Then{ expect(repo).to have_received(:create_score).with(params)}
        And { expect(repo).to have_received(:save_score).with(score)}
        And { expect(score.errors).to be_empty }
        specify { expect { |b| runner.save_score(params, &b) }.to yield_with_args(:success, score)}
      end

      context "with errors" do
        Given(:repo){ double(create_score: score, save_score: false) }
        Given{ allow(score).to receive(:errors){ ["errore"] }  }
        When{ runner.save_score(params, &callback) }
        Then{ expect(repo).to have_received(:create_score).with(params)}
        Then{ expect(repo).to have_received(:save_score).with(score) }
        And { expect(score.errors).to_not be_empty }
        specify { expect { |b| runner.save_score(params, &b) }.to yield_with_args(:failure, score)}
      end
    end

    describe "#new_score" do
      Given(:repo){ double(create_score: Biz::Score.new({}) ) }

      When(:result){ runner.new_score({}) }
      Then{ expect(result).to be_kind_of(Biz::Score) }
    end

    describe "#all_scores" do
      Given(:repo){ double(all_scores: [Biz::Score.new({})]) }

      When(:result){runner.all_scores }
      Then{ expect(result).to be_kind_of(Array) }
      And{ expect(result.first).to be_kind_of(Biz::Score) }
    end
  end

  describe "Boss" do
    describe "#all_bosses" do
      Given(:repo){ double(all_bosses: [Biz::Boss.new({})]) }

      When(:result){ runner.all_bosses }
      Then{ expect(result).to be_kind_of(Array) }
      And{ expect(result.first).to be_kind_of(Biz::Boss) }
    end
  end
end
