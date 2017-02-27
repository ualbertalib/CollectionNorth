class CollectionNorth::CollectionsController < CurationConcerns::CollectionsController
#  include CurationConcerns::CollectionsControllerBehavior


  # # ======> H A C K <=======
  # prepend_view_path "#{Gem.loaded_specs['curation_concerns'].full_gem_path}/app/views/"
  #
  # def _prefixes
  #   @prefixes ||= super.unshift('collections')
  # end


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
