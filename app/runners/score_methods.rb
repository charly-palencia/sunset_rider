module ScoreMethods
  def save_score(params)
    score = @repo.create_score(params)
    result = :failure
    if @repo.save_score(score)
      result = :success
    end
    yield result, score
  end

  def new_score(params={})
   @repo.create_score(params)
  end

  def all_scores
    @repo.all_scores
  end
end
