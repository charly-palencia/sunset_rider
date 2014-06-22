# Jim Weirich base model from https://raw.githubusercontent.com/jimweirich/wyriki/master/app/models/biz/model.rb
require "delegate"

module Biz
  class Model < SimpleDelegator
    # TODO: ban active record save/update methods

    def data
      __getobj__
    end

    def class
      data.class
    end

    def self.wrap(model)
      model ? new(model) : nil
    end

    def self.wraps(models)
      models.map { |model| wrap(model) }
    end
  end
end
