class Repository

  def create_score(params={})
    Biz::Score.wrap(Score.new(params))
  end

  def save_score(score)
    score.data.save
  end

  def all_bosses
   Biz::Boss.wraps(Boss.all)
  end
end
