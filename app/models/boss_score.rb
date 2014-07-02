class BossScore
  include DataMapper::Resource
  storage_names[:default] = "bosses_scores"

  belongs_to :bosses, :model => 'Boss', :child_key => [:boss_id]
  belongs_to :scores, :model => 'Score', :child_key => [:score_id]

  # Attributes
  property :id, Serial
  property :boss_id, Integer
  property :score_id, Integer
end
