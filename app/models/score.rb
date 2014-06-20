class Score < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :enemies_killed

  validates_numericality_of :enemies_killed
end
