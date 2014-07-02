class Score
  include DataMapper::Resource

  # Attribures
  property :id, Serial
  property :name, String
  property :enemies_killed, Integer

  validates_presence_of :name
  validates_presence_of :enemies_killed

  validates_numericality_of :enemies_killed

  has n, :boss_scores
  has n, :bosses, model: "Boss", child_key: [:id], parent_key: [:score_id], through: :boss_scores

  def boss_ids=(boss_ids)
    boss_ids.each{|id|
      bosses << Boss.get(id)
    }
  end
end
