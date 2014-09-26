module ShopsHelper
    def url_with_http_protocol(url)
        /^http/i.match(url) ? url : "http://#{url}"
    end

end
