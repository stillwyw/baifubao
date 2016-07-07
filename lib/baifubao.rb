require "baifubao/version"
require "baifubao/signature"
require "baifubao/util"
require "baifubao/url_generator"

module Baifubao
  
  module Config
    class << self
      attr_accessor :sp_no, :key
    end
  end
  
  def self.direct_pay_url params={}
    url = "https://www.baifubao.com/api/0/pay/0/direct"
    params[:service_no] = 1

    Util.require_params([:order_create_time, :order_no, :goods_name, :total_amount, :currency, :return_url, :pay_type, ], params.keys)

    UrlGenerator.new(url,params).url
  end
  
end
