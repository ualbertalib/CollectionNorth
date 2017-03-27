class CollectionNorth::Collection < ActiveFedora::Base
  include ::CurationConcerns::CollectionBehavior
  include CurationConcerns::BasicMetadata

  self.indexer = ::CollectionNorth::CollectionIndexer

  # TODO A real predicate for this -- mb
  class MyTerms < ::RDF::Vocabulary("http://terms.library.ualberta.ca/id/")
    term :foo
  end

  property :community_id, predicate: MyTerms.foo, multiple: false do |index|
    # TODO change this, we don't need paths here per
    index.as :descendent_path
  end

  def path
    "#{community}/#{id}"
  end

  # Add members using the members association.
  def add_members(new_member_ids)
    raise "Don't use add_members. It's a bad idea and a performance nightmare"
    # return if new_member_ids.nil? || new_member_ids.empty?
    # members << ActiveFedora::Base.find(new_member_ids)
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
