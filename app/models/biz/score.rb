require "delegate"

module Biz
  class Score < SimpleDelegator

    def data
      __getobj__()
    end

    def class
      data.class
    end

    def errors
      data.errors.messages
    end
  end
end
