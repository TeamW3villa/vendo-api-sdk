require "uri"
require "net/http"
require "json"

module Services
  module CartOperations
    class RemoveItem < Services::Object

      ENDPOINT_URL = "https://demo.getvendo.com/api/v2/storefront/cart/remove_line_item"

      def initialize(id)
        @item_id = id
      end
      
      def call
        url = URI("#{ENDPOINT_URL}/#{@item_id}")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Delete.new(url)
        request["Accept"] = 'application/vnd.api+json'

        response = JSON.parse(http.request(request).read_body)
        p response
        errors.add_multiple_error(response) if response['error']
      end
    end
  end
end