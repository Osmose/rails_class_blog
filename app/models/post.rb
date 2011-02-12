class Post < ActiveRecord::Base
    validates :user_id, :presence => true
    validates :title, :presence => true
    
    belongs_to :user
    
    # Pagination
    cattr_reader :per_page
    @@per_page = 5
    
    def author
        if not self.user.nil?
            self.user.name
        else
            "Anonymous"
        end
    end
    
    # Statics
    def self.find_by_permalink(permalink)
        Post.first(
            :permalink => permalink
        )
    end
end
