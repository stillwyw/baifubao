module Baifubao
  class UrlGenerator

    attr_reader :url
    
    def initialize(url, params, options={})
      @url = url
      @params = params
      @params[:sp_no] ||= Baifubao::Config.sp_no
      @params[:version] ||= 2
      @params[:input_charset] ||= 1
      @params[:sign_method] ||= 1
      @params[:sign] = Baifubao::Signature.sign(@params)

      @url += "?#{@params.map{|m| m.join("=")}.join("&")}"
    end
    
  end
end