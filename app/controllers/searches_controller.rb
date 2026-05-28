class SearchesController < ApplicationController
  def index
    @query = params[:query]

    if @query.present?
      @clients = Client.search(@query).order(created_at: :desc)
      @leads = Lead.search(@query).order(created_at: :desc)
    else
      @clients = Client.none
      @leads = Lead.none
    end
  end
end
