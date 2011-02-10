module ApplicationHelper

    def markdown(str)
        BlueCloth::new(text).to_html
    end

end
