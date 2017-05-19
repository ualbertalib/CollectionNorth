class CollectionNorth::CommunitiesController < CollectionNorth::CollectionsController
  self.list_search_builder_class = CollectionNorth::CommunitySearchBuilder
  self.single_item_search_builder_class = CollectionNorth::SingleCommunitySearchBuilder

  load_and_authorize_resource except: [:index, :show], instance_name: :community

  protected

  def community_params
    form_class.model_attributes(params[:community])
  end
end
