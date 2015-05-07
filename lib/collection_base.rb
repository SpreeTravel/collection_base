require "collection_base/version"

module CollectionBase
  require 'collection_base/base'
  include Cenithub::Client

  register = []

  def register (collection)
    @register << collection
  end

  def registers
    @register
  end

end
