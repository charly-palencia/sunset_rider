require 'rails_helper'

describe ScoresController do
  describe "GET new" do
    When(:subject){ get :new }
    Then{ expect(response.code).to be_eql("200") }
    And { expect(subject).to render_template("scores/new") }
    And { expect(controller.score).to be_a_kind_of(Biz::Score) }
  end
end
