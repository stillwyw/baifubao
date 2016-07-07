module Baifubao
  module Signature
    def self.sign(hash)
      key = Baifubao::Config.key
      str = hash.sort.map{|m| m.join("=")}.join("&")
      str += "&key=#{key}"
      Digest::MD5.hexdigest(str)      
    end
    
    def self.check_sign(hash)
      key = Baifubao::Config.key
      signature = hash[:sign] || hash['sign']
      hash.delete(:sign)
      hash.delete('sign')
      raise Baifubao::Error.new, "Signature does not match! The signature from wechat is #{signature} the one you got is #{sign(hash)}" unless signature.upcase == sign(hash).upcase
    end
  end
end