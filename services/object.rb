require './auth'
require_relative 'errors'
require 'json'

module Services
  class Object
    class << self
      def call(*args)
        new(*args).constructor
      end
    end

    attr_reader :result

    def constructor
      @result = call
      self
    end

    def success?
      !failure?
    end

    def failure?
      errors.any?
    end

    def errors
      @errors ||= Services::Errors.new
    end

    def authorized?
      auth_response['error'].empty?
    end

    def auth_token
      @auth_token ||= auth_response['access_token']
    end

    def auth_response
      @auth_response ||= JSON.parse(Auth.response.read_body)
    end

  end
end