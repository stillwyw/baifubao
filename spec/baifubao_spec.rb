require 'spec_helper'
require 'rubygems'
require 'yaml'
describe Baifubao do
  @config = YAML::load_file("spec/test_config.yml")
  Baifubao::Config.key = @config['Baifubao']['key']
  Baifubao::Config.sp_no = @config['Baifubao']['sp_no']
  
  it "should return a good url" do
    url = Baifubao::API.direct_pay_url(
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
  
  it 'Should verify the returned params' do
    params = "bank_no=&bfb_order_create_time=20160708151639&bfb_order_no=2016070810005998611111947805443&buyer_sp_username=&currency=1&extra=&fee_amount=0&input_charset=1&order_no=R214064351&pay_result=1&pay_time=20160708151639&pay_type=2&sign_method=1&sp_no=1000599861&total_amount=10&transport_amount=0&unit_amount=10&unit_count=1&version=2&sign=c5999b814e0410d0aa86e3830bf8166d"
    params = params.split("&").map do |h|
      h = h.split("=")
      h.size == 2 ? {h[0] => h[1]} : { h[0] => ''}
    end.reduce Hash.new, :merge
    
    puts params
    
    notify = Baifubao::NotifyHandler.new(params)
    
    puts notify.valid?
    
    
  end
end
