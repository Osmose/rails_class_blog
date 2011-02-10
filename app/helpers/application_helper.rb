module ApplicationHelper

    def markdown(str)
        BlueCloth::new(text).to_html
    end
    
    def link_to_post(text, post)
        unless post.permalink.nil?
            return "<a href=\"/#{post.permalink}\">#{text}</a>".html_safe
        else
            return link_to text, post
        end
    end
end
