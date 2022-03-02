class FetchRepositoriesService < ApplicationService
  attr_reader :search, :base_url, :page

  def initialize(search, page)
    @search = search
    @page = page
    @page ||= 1
    @base_url = 'https://api.github.com/search/repositories'
  end

  def call
    repositories = []
    response = JSON.parse(RestClient.get("#{base_url}?q=#{search}&per_page=10&page=#{page}"))
    response['items'].each do |res|
      repositories << Repository.new(res.fetch('name', ''), res.fetch('html_url', ''), res['owner']['avatar_url'])
    end
    Kaminari.paginate_array(repositories, total_count: response['total_count']).page(page).per(10)
  end
end