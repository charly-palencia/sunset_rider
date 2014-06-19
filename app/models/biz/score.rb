module Biz
  class Score < SimpleDelegator

    def data
      __getobj__()
    end

    def class
      data.class
    end
  end
end
