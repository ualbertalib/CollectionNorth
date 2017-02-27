class CollectionNorth::CommunitySearchBuilder < CurationConcerns::CollectionSearchBuilder
  # Overrides CurationConcerns::CollectionSearchBuilder#models
  def models
    [CollectionNorth::Community]
  end
end
