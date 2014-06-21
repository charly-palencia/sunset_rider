class ScoresController < ApplicationController
  expose(:runner){ Runner.new(self, Repository.new) }
  expose(:score){ runner.new_score }
  expose(:bosses){ runner.new_bosses }

  def index
  end

  def create
    runner.save_score(score_params) do |response, score|
      @score = score
      if response == :success
        redirect_to scores_path, notice: "valid created"
      else
        flash[:alert] = "Something wrong"
        render :new
      end
    end
  end

  private
  def score_params
    params.require(:score).permit(:name, :enemies_killed)
  end
end
