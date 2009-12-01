function googleAnalytics(code, domain) {
        var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
        var url = gaJsHost + "google-analytics.com/ga.js";
        $.getScript(url, function(){
            var pageTracker = _gat._getTracker(code);
            pageTracker._setDomainName(domain);
            pageTracker._initData();
            pageTracker._trackPageview();
            
            $(".ga-track").click(function(){
                pageTracker._trackPageview( ($(this).attr("rel")) ? ($(this).attr("rel")) : ($(this).attr("src")));
            })
        })
}
