class ScoresController < ApplicationController
  expose(:runner){ Runner.new(self, Repository.new) }
  expose(:score){ runner.new_score }
end
