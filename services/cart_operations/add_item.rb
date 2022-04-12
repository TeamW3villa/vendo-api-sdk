require "uri"
require "net/http"
require "json"

module Services
  module CartOperations
    class Create < Services::Object

      ENDPOINT_URL = 'https://demo.getvendo.com/api/v2/storefront/cart/add_item'

      def initialize(variant_id, quantity)
        @variant = variant_id
        @quantity = quantity
      end

      def call
        url = URI("#{ENDPOINT_URL}?fields[cart]=#{auth_token}")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Post.new(url)
        request["Accept"] = 'application/vnd.api+json'
        request["Content-Type"] = 'application/vnd.api+json'
        requues.body = {
          "variant_id": @variant_id, 
          "quantity": @quantity
        }.to_json

        response = JSON.parse(http.request(request).read_body)
        
        errors.add_multiple_error(response) if response['error']
      end
    end
  end
end