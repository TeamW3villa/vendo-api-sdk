module Services
  class Errors < Hash
    
    def add(key, value, _opts={})
      self[key] ||= []
      self[key] << value
      self[key].uniq!
    end

    def add_multiple_error(errors_hash)
      errors_hash.each do |key, value|
        add key, value
      end
    end

  end
end