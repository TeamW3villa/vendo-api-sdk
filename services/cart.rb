require "uri"
require "net/http"

require_relative 'object'
require_relative 'cart_operations/create'

module Services
  class Cart < Services::Object
    attr_accessor :quantity, :item_id

    def create
      authenticate!
      take_action :create_cart unless errors.any?
    end

    def get item_id
      authenticate!
      @item_id = item_id
      take_action :get_cart unless errors.any?
    end

    def add_item
      authenticate!
      take_action :add_item unless errors.any?
    end

    def set_quantity quantity: 1
      authenticate!
      @quantity = quantity
      take_action :set_quantity unless errors.any?
    end

    def remove_item item_id
      @item_id = item_id
      authenticate!
      take_action :remove_item unless errors.any?
    end

    def authenticate!
      errors.add :validation, auth_response['error'] unless authorized?
      p errors if errors.any?
    end

    private

    def take_action action_name
      case action_name
      when :create_cart
        Services::CartOperations::Create.new.call
      when :get_cart
        Services::CartOperations::Get.new(item_id).call
      when :add_item
        Services::CartOperations::AddItem.new(variant_id, quantity).call
      when :set_quantity
        Services::CartOperations::SetQuantity.new(quantity).call
      when :remove_item
        Services::CartOperations::RemoveItem.new(item_id).call
      end
        
    end
  end
end