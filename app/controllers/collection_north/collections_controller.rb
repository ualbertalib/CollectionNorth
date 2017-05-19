class CollectionNorth::CollectionsController < CurationConcerns::CollectionsController

  # override CurationConcerns::CollectionsController#add_members_to_collection
  # per: https://github.com/projecthydra/curation_concerns/pull/901/files
  def add_members_to_collection(collection = nil)
    collection ||= @collection
    collection.add_member_objects batch
  end

  # override CurationConcerns::CollectionsController#remove_members_to_collection
  # per: https://github.com/projecthydra/curation_concerns/pull/901/files
  def remove_members_from_collection
    batch.each do |pid|
      work = ActiveFedora::Base.find(pid)
      work.member_of_paths.delete @collection.path
      work.save!
    end
  end
end

# HACK monkey patch, but it's not clear at the moment where a good seam to inject this is
# as this module is pulled into tons of search builders, all of which would need to be overridden
# this is also more-or-less-redundant and can possibly share some constant(s) with Ability#curation_concerns_models
module CurationConcerns
  module FilterByType
    def collection_classes
      return [] if only_works?
      [::Collection, CollectionNorth::Collection]
    end
  end
end
