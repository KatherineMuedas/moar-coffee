module ApplicationHelper
  # def countlines 
  #    # find . -iname "*.rb" -type f -exec cat {} \; | wc -l
  # end
  def twitter_link()
    share_url = "https://twitter.com/share"
    anchor = link_to "Tweet", share_url, class: 'twitter-share-button', data: "your_screen_name"
    js = '<script type="text/javascript">window.twttr=(function(d,s,id){var t,js,fjs=d.getElementsByTagName(s)[0];if(d.getElementById(id)){return}js=d.createElement(s);js.id=id;js.src="https://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);return window.twttr||(t={_e:[],ready:function(f){t._e.push(f)}})}(document,"script","twitter-wjs"));</script>'
    (anchor + raw(js)) 
  end
end