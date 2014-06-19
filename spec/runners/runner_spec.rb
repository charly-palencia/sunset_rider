require "spec_helper"
require "app/models/biz/score"
require "app/runners/runner"

describe Runner do
  Given(:context){ double("context", success: true) }
  Given(:score){ double(name: "Jhon Doe") }
  Given(:callback){ lambda {|success, element|} }
  Given(:runner){ Runner.new(context, repo) }

  describe "#create_score" do
    Given(:params){ { name: "jhon Doe"} }

    context "when information is valid" do
      Given(:repo){ double(create_score: score, save_score: true) }
      Given{ allow(score).to receive(:errors){ [] }  }

      When{ runner.create_score(params, &callback) }
      Then{ expect(repo).to have_received(:create_score).with(params)}
      And { expect(repo).to have_received(:save_score).with(score)}
      And { expect(score.errors).to be_empty }
      specify { expect { |b| runner.create_score(params, &b) }.to yield_with_args(true, score)}
    end

    context "with errors" do
      Given(:repo){ double(create_score: score, save_score: false) }
      Given{ allow(score).to receive(:errors){ ["errore"] }  }

      When{ runner.create_score(params, &callback) }
      Then{ expect(repo).to have_received(:create_score).with(params)}
      Then{ expect(repo).to have_received(:save_score).with(score) }
      And { expect(score.errors).to_not be_empty }
      specify { expect { |b| runner.create_score(params, &b) }.to yield_with_args(false, score)}
    end
  end

  describe "#new_score" do
    Given(:repo){ double(create_score: Biz::Score.new ) }

    When(:result){ runner.new_score([]) }
    Then{ expect(result).to be_kind_of(Biz::Score) }
  end
end
