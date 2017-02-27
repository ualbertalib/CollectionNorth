class CollectionNorth::CollectionIndexer < CurationConcerns::CollectionIndexer
  def generate_solr_document
    super.tap do |solr_doc|
      # Since titles are multivalued, but sorting by title is basic good UX, we need to index the first title value
      # as a single-valued property on the solr document for sorting purposes
      if object.title && !object.title.empty?
        Solrizer.insert_field(solr_doc, 'sortable_title', object.title.first.downcase, :stored_sortable)
      end
    end
  end
end
