module Baifubao
  class NotifyHandler
    
    attr_reader :result
    
    def initialize(params)
      @params = params
      @result = OpenStruct.new(@params) 
    end
    
    def valid?
      Baifubao::Signature.check_sign(@params)
    end
    
    
  end
end