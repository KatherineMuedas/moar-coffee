module ShopsHelper
  def background_image
    #need to change url when deployed heroku 
    if request.original_url == "http://localhost:3000/" || "http://localhost:3000/shops" ||params[:search]  
       'pic overlay' 
    else
        ''
    end
  end
    # def url_with_http_protocol(url)
    #     /^http/i.match(url) ? url : "http://#{url}"
    # end

end
