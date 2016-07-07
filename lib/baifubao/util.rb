module Baifubao
  module Util
    def self.require_params(required_params=[], current_params=[])
      required_params += [:merchant_sign, :merchant_num]
      required_params.each do |param|
        raise "param #{param} is required for this API" unless current_params.include?(param)
      end
    end
  end
end