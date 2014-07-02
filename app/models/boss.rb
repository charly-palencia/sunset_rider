class Boss
  include DataMapper::Resource


  # Attributes
  property :id, Serial
  property :name, String
  property :image_url, String
  property :points, Integer

  has n, :boss_scores
  has n, :scores, model: "Score", child_key: [:id], parent_key: [:boss_id], through: :boss_scores

end
