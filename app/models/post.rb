class Post < ActiveRecord::Base
    validates :user_id, :presence => true
    validates :title, :presence => true
    
    belongs_to :user
    
    def author
        unless self.user.nil?
            return self.user.name
        else
            return "Anonymous"
        end
    end
end
