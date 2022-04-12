require "uri"
require "net/http"
require 'json'

class Auth
  
  ENDPOINT_URL = "https://demo.getvendo.com/spree_oauth/token".freeze
  
  def self.response
    url = URI(ENDPOINT_URL)

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Accept"] = 'application/vnd.api+json'
    request["Content-Type"] = 'application/vnd.api+json'
    request.body = {"username": "vendo@example.com", "password": "vendo123"}.to_json

    http.request(request)
  end
end