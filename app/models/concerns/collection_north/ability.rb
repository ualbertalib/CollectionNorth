module CollectionNorth::Ability
  # in this case we're expecting the include-ing class to first include CurationConcerns::Ability
  # and then include this, so that we can override curationconcerns' implementation of this method
  # to inject our collection and community types. Needed for the way CurationConcerns implements
  # authorization against curationconerns models
  def curation_concerns_models
    super + [::CollectionNorth::Collection, ::CollectionNorth::Community]
  end
end
