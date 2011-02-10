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
    
    def disqus_thread_id(id)
        s = '<script type="text/javascript">var disqus_identifier = "' + id + '";</script>'
        
        return s.html_safe + disqus_thread.html_safe
    end
end
