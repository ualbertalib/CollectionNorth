class CollectionNorth::Collection < ActiveFedora::Base
  include ::CurationConcerns::CollectionBehavior
  include CurationConcerns::BasicMetadata

  self.indexer = ::CollectionNorth::CollectionIndexer

  # TODO A real predicate for this -- mb
  class MyTerms < ::RDF::Vocabulary("http://terms.library.ualberta.ca/id/")
    term :foo
  end

  property :community_id, predicate: MyTerms.foo, multiple: false do |index|
    # TODO can we change this, as we don't need paths here, just the id, OR
    # should it be kept for symmetry of faceting?
    index.as :descendent_path
  end

  def path
    "#{community_id}/#{id}"
  end

  # Add members using the members association.
  # Semantically, in Esme's original reversal patch, this added item IDs to the collection, whereas
  # add_member_objects added collection ids to the item. Since we always want the latter behaviour, and
  # never want callers attempting to achieve the former, this is left in place to catch anything trying
  # to do things the "bad" way
  def add_members(new_member_ids)
    raise "Don't use add_members. It's a bad idea and a performance nightmare"
  end

  # Add member objects by adding this collection to the objects' member_of_collection association.
  def add_member_objects(new_member_ids)
    Array(new_member_ids).each do |member_id|
      member = ActiveFedora::Base.find(member_id)
      member.member_of_paths << self.path
      member.save!
    end
  end

  # TODO will this work or do we need to build comm/id paths for every comm this coll is in? -- mb
  def member_objects
    ActiveFedora::Base.where("member_of_paths_dpsim:#{id}")
  end
end
