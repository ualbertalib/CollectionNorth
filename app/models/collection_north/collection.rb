class CollectionNorth::Collection < ActiveFedora::Base
  include ::CurationConcerns::CollectionBehavior
  include CurationConcerns::BasicMetadata

  self.indexer = ::CollectionNorth::CollectionIndexer
end
