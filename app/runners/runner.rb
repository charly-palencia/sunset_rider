class Runner
  def initialize(context, repo)
    @context, @repo = context, repo
  end

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

  def all_bosses
    @repo.all_bosses
  end
end
