class Repository

  def create_score(params={})
    Biz::Score.new(Score.new(params))
  end
end
