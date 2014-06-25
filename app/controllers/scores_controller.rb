class ScoresController < ApplicationController
  expose(:repo){ Repository.new }
  expose(:runner){ Runner.new(self, repo) }
  expose(:score){ runner.new_score }
  expose(:scores){ ScoreDecorator.decorate_collection(runner.all_scores_sort_by_total.reverse) }
  expose(:bosses){ runner.all_bosses }
  expose(:bosses_total){ repo.count_bosses }

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
    params.require(:score).permit(:name, :enemies_killed, boss_ids: [])
  end
end
