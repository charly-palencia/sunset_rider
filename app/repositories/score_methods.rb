module Repositories
  module ScoreMethods
    def create_score(params={})
      Biz::Score.wrap(Score.create(params))
    end

    def save_score(score)
      score.data.save
    end

    def all_scores
      Biz::Score.wraps(Score.all)
    end
  end
end
