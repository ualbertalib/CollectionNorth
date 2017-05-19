require 'rails_helper'

describe CollectionNorth::Collection, type: :model do
  context 'A collection a title' do
    let(:collection) { FactoryGirl.build(:collection) }

    it 'should have our indexer' do
      expect(CollectionNorth::Collection.indexer).to eq CollectionNorth::CollectionIndexer
    end

    it 'should index the first title, downcased, as the sortable_title' do
      solrized_collection = collection.to_solr
      expect(solrized_collection).to have_key('sortable_title_ssi')
      expect(solrized_collection['sortable_title_ssi']).to eq 'foo'
    end
  end
end
