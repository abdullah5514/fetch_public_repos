class Repository
  attr_accessor :name, :html_url, :owner_avatar
  def initialize(name, html_url, owner_avatar)
    @name = name
    @html_url = html_url
    @owner_avatar = owner_avatar
  end
end