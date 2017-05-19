require 'rails_helper'

describe CollectionNorth::Community, type: :model do
  context 'A community with a title' do
    let(:community) { FactoryGirl.build(:community) }

    it 'should have our indexer' do
      expect(CollectionNorth::Community.indexer).to eq CollectionNorth::CollectionIndexer
    end

    it 'should index the first title, downcased, as the sortable_title' do
      solrized_community = community.to_solr
      expect(solrized_community).to have_key('sortable_title_ssi')
      expect(solrized_community['sortable_title_ssi']).to eq 'foo'
    end
  end
end
