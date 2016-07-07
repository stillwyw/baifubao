module Baifubao
  class UrlGenerator

    def initialize(url, params, options={})
      @url = url
      @params = params
      @params[:sp_no] ||= Baifubao::Config.sp_no
      @params[:key] ||= Baifubao::Config.key
      @params[:sign] = Baifubao::Signature.sign(@params)
      @params[:version] ||= 2
      @params[:input_charset] ||= 1
      @params[:sign_method] ||= 1
      @url += @params.map{|m| m.join("=")}.join("&")
    end
    
  end
end