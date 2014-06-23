require "./app/runners/score_methods"

class Runner
  include ScoreMethods

  def initialize(context, repo)
    @context, @repo = context, repo
  end
  def all_bosses
    @repo.all_bosses
  end
end
