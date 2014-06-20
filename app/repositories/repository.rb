class Repository

  def create_score(params={})
    Biz::Score.new(Score.new(params))
  end

  def save_score(score)
    score.data.save
  end
end
