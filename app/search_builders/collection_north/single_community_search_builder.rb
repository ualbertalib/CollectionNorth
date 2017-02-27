class CollectionNorth::SingleCommunitySearchBuilder < CurationConcerns::WorkSearchBuilder
  # Overrides CurationConcerns::CollectionSearchBuilder#models
  def models
    [CollectionNorth::Community]
  end
end
