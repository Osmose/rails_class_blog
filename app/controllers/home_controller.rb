class HomeController < ApplicationController
  def index
    @recent_posts = Post.find(:all,
        :limit => 3,
        :order => "created_at desc"
    )
  end

end
