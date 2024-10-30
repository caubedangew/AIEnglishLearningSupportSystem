class UsersController < ApplicationController
  layout "frontend"
  require "async"
  require "net/http"
  before_action :set_base_url, :authenticate

  def fetchAPI(uri, method, auth = false, query_params = nil, data = nil)
    if query_params
      uri += uri.include?("?") ? "&" : "?"
      query_params.each do |key, value|
        uri += "#{key}=#{value}&"
      end
    end

    uri = URI.parse("#{@BASE_URL}#{uri}")


    if method == "get"
      request = Net::HTTP::Get.new(uri)
    elsif method == "post"
      request = Net::HTTP::Post.new(uri)
      request.set_form_data(data)
    end

    if auth
      request["Authorization"] = "Bearer #{session[:token]}"
    end

    response = Net::HTTP.start(uri.host, uri.port) do |http|
      http.read_timeout = 10
      http.request(request)
    end

    return response
  end

  private
    def authenticate
      if !session[:user]
        redirect_to users_login_path, alert: "You must be logged in to access that page"
      end
    end

    def set_base_url
      @BASE_URL = "http://127.0.0.1:3000/api"
    end
end
