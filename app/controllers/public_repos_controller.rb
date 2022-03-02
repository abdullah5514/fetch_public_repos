class PublicReposController < ApplicationController

  def index
    @repositories = []
    if params[:q].present?
      @repositories = FetchRepositoriesService.call(params[:q], params[:page])
    end
  end
end
