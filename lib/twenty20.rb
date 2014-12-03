require 'httparty'
require 'active_support/inflector'
require 'active_support/core_ext/hash/conversions'

%w(version client api_object item challenge).each do |file|
  require "twenty20/#{file}"
end

module Twenty20
end
