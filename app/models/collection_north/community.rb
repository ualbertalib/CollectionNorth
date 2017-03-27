# https://github.com/ualbertalib/Hydranorth2/issues/57

class CollectionNorth::Community < CollectionNorth::Collection

  self.indexer = ::CollectionNorth::CommunityIndexer
end
