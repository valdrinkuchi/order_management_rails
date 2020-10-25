unless Hash.method_defined?(:transform_values)
  class Hash
    def transform_values &block
      each_pair do |k, v|
        self[k] = block.call(v)
      end
    end
  end
end
