require "collection_base/version"

module CollectionBase
  require 'collection_base/base'
  include Cenithub::Client

  register = []

  def registers_set (collection)
    @register << collection
  end

  def registers_get
    @register
  end

end
