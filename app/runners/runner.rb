class Runner
  def initialize(context, repo)
    @context, @repo = context, repo
  end

  def create_score(params)
    score = @repo.create_score(params)
    result = false
    if @repo.save_score(score)
      result = true
    end
    yield result, score
  end

  def new_score(params={})
   @repo.create_score(params)
  end
end
