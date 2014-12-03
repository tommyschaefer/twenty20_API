module Twenty20
  class ApiObject
    def self.attributes
      []
    end

    def initialize(attributes = {})
      self.class.attributes.each do |attr|
        instance_attr = "@#{attr}"
        define_singleton_method(attr) { instance_variable_get(instance_attr) }
        instance_variable_set(instance_attr, attributes[attr])
      end
    end
  end
end
