module CollectionNorth

  class AddAsMemberOfCollectionsActor < CurationConcerns::Actors::AbstractActor
    def create(attributes)
      collection_ids = attributes.delete(:member_of_paths)
      add_to_collections(collection_ids) && next_actor.create(attributes)
    end

    def update(attributes)
      collection_ids = attributes.delete(:member_of_paths)
      add_to_collections(collection_ids) && next_actor.update(attributes)
    end

    private

      # Maps from collection ids to collection objects
      def add_to_collections(collection_ids)
        return true unless collection_ids
        curation_concern.member_of_paths = collection_ids.map { |id| ::Collection.find(id).path }
      end
  end
end
