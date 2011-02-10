class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  # Courtesy of http://snippets.dzone.com/posts/show/4457
  def permalink(string, separator = '-', max_size = 127)
    # words to ignore, usually the same words ignored by search engines
    ignore_words = ['a', 'an', 'the']
    ignore_re    = String.new
    
    # building ignore regexp
    ignore_words.each{ |word|
      ignore_re << word + '\b|\b'
    }
    ignore_re = '\b' + ignore_re + '\b'
    
    # delete ignore words
    permalink = string.gsub(ignore_re, '')

    # all down
    permalink.downcase!

    # preserve alphanumerics, underscore, dash, and spaces, everything else goes away
    permalink.gsub!(/[^a-z0-9_\- ]+/, '')
    
    # convert spaces to seperators
    permalink.gsub!(/\s/, separator)
    
    # enforce the maximum component length and return it
    permalink = permalink.to(max_size)
    
    # trim any leading or trailing separators
    return permalink.gsub(/^\\#{separator}+|\\#{separator}+$/, '')
  end
end
