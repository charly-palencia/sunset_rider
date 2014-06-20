require 'rails_helper'

describe ScoresController do
  describe "GET new" do
    When(:subject){ get :new }
    Then{ expect(response.code).to be_eql("200") }
    And { expect(subject).to render_template("scores/new") }
    And { expect(controller.score).to be_a_kind_of(Biz::Score) }
  end

  describe "POST create" do

    context "when receive valid data" do
      Given(:params){ {score: {name: "Jhon Doe", enemies_killed: 12} } }
      When(:subject){ post :create , params }
      Then{ subject.should redirect_to("/scores") }
      And { expect(flash[:notice]).to_not be_nil }
      And{ expect(assigns(:score)).to_not be_nil }
    end

    context "when receive not valid data" do
      Given(:params){ {score: {name: "Jhon Doe", enemies_killed: "no numbers"} } }
      When(:subject){ post :create , params }
      Then{ subject.should render_template("scores/new") }
      And { expect(flash[:notice]).to be_nil }
      And { expect(flash[:alert]).to_not be_nil }
      And{ expect(assigns(:score)).to_not be_nil }
    end
  end
end
