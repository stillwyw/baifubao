require 'spec_helper'
require 'rubygems'
require 'yaml'
describe Baifubao do
  @config = YAML::load_file("spec/test_config.yml")
  Baifubao::Config.key = @config['Baifubao']['key']
  Baifubao::Config.sp_no = @config['Baifubao']['sp_no']
  
  it "should return a good url" do
    url = Baifubao.direct_pay_url(
      order_no: '343043020342432',
      order_create_time: Time.now.strftime("%Y%m%d%H%M%S"),
      goods_name: "hahahahahahahahahahahah",
      total_amount: (30.5 * 100).round,
      currency: 1,
      return_url: 'http://github.com',
      page_url: 'http://github.com',
      pay_type: 3,
      bank_no: 201
    )
    
    puts url
    
  end
end
