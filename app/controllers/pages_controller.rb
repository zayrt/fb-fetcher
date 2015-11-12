class PagesController < ApplicationController
  before_action :set_graph, only: [:show, :create]
  
  def index
  	@pages = Page.all
  end

  def create
  	page = @graph.get_object(params[:id])
  	p = Page.create(name: page['name'], fb_id: page['id'])
  	if p.errors.any?
  			redirect_to root_path, alert: p.errors.full_messages.join(". ")
  	else
  			redirect_to root_path, notice: "Votre page a bien été ajouté !"
  	end
  rescue
    redirect_to root_path, alert: "Page ID invalid"
  end

  def show
  	@page = Page.find(params[:id])
    @feeds = @graph.get_connections(@page.fb_id, "feed")
  end

  private
    def set_graph
      oauth = Koala::Facebook::OAuth.new(Facebook::APP_ID, Facebook::SECRET)
      @graph = Koala::Facebook::API.new(oauth.get_app_access_token)
    end
end
