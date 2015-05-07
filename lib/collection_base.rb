require "collection_base/version"

module CollectionBase
  require 'collection_base/base'
  include Cenithub::Client

  class << self; attr_accessor :register; end
  self.register = []

end
