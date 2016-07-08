module Baifubao
  module Signature
    def self.sign(hash)
      key = Baifubao::Config.key
      str = hash.sort.map{|m| m.join("=")}.join("&")
      str += "&key=#{key}"
      # puts "stuf before singing here ..... #{str}"
      Digest::MD5.hexdigest(str)      
    end

    def self.check_sign(hash)
      key = Baifubao::Config.key
      signature = hash[:sign] || hash['sign']
      hash.delete(:sign)
      hash.delete('sign')
      if signature.upcase == sign(hash).upcase
        return true
      else
        return false
      end
    end
    
    def self.check_sign!(hash)      
      raise "Signature does not match! The signature from baidu is #{signature} the one you got is #{sign(hash)}" unless self.check_sign(hash)
    end
  end
end