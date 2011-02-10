class HomeController < ApplicationController
  def index
    @recent_posts = Post.paginate(
        :page => params[:page], 
        :order => "created_at DESC"
    )
  end

end
