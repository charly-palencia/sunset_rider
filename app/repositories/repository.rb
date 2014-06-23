require "./app/repositories/score_methods.rb"
class Repository
  include Repositories::ScoreMethods
  def all_bosses
   Biz::Boss.wraps(Boss.all)
  end

  def count_bosses
    Boss.count
  end
end
