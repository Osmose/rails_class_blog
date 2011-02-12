(function ($) {
    $(function () {
        /**
         * Parses option line at the beginning of <pre> blocks to set their language
         * for SyntaxHighlight. String is of the form "#lang=LANGUAGE"
         */
        $("pre").each(function(i, e) {
            var elem = $(e);
            var text = $.trim(elem.text()).split(/\r\n|\r|\n/);
            var first = text[0];
            if (first.indexOf("#lang=") === 0) {
                var lang = first.substring(6);
                
                // Remove first line and join the rest
                elem.text(text.splice(1).join("\n"));
                
                SyntaxHighlighter.highlight({
                    brush: lang
                }, e);
            } else {
                SyntaxHighlighter.highlight(null, e);
            }
        });
    });
})( jQuery );