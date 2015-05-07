require "collection_base/version"

module CollectionBase
  require 'collection_base/base'
  include Cenithub::Client
  @register = []
  class << self; attr_accessor :register; end
end