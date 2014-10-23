module ShopsHelper
  def background_image
    #need to change url when in heroku 
    if request.original_url == "http://localhost:3000/" || params[:search]  
       'pic' 
    else
        ''
    end
  end
    # def url_with_http_protocol(url)
    #     /^http/i.match(url) ? url : "http://#{url}"
    # end

end
