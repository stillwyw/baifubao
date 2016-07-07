module Baifubao
  class UrlGenerator

    def initialize(url, params, options={})
      @url = url
      @params = params
      @params[:sp_no] = params[:sp_no] || Baifubao::Config.sp_no
      @params[:key] = params[:key] || Baifubao::Config.key
      @params[:sign] = Baifubao::Signature.sign(@params)
      @url += @params.map{|m| m.join("=")}.join("&")
    end
    
  end
end