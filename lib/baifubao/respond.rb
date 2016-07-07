module Baifubao
  class Respond < OpenStruct
    attr_reader :hash

    def initialize(respond_hash)
      @hash = respond_hash
      super(respond_hash)
    end
  end
end