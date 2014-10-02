module ApplicationHelper
  def twitter_link()
    share_url = "https://twitter.com/share"
    anchor = link_to "Tweet", share_url, class: 'twitter-share-button', data: "your_screen_name"
    js = '<script type="text/javascript">window.twttr=(function(d,s,id){var t,js,fjs=d.getElementsByTagName(s)[0];if(d.getElementById(id)){return}js=d.createElement(s);js.id=id;js.src="https://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);return window.twttr||(t={_e:[],ready:function(f){t._e.push(f)}})}(document,"script","twitter-wjs"));</script>'
    (anchor + raw(js)) 
  end
  
  def like_button(options={})
    like_options = {
      'data' => {
        'layout' => 'standard',
        'action' => 'like',
        'show-faces' => 'true',
        'share' => 'true'
      },
      'class' => 'fb-like'
    }
    if (options.has_key?(:href))
      like_options['data']['href'] = options[:href]
    end
    # '<div class="fb-like" data-href="https://developers.facebook.com/docs/plugins/" data-layout="standard" data-action="like" data-show-faces="true" data-share="true"></div>'
    content_tag('div', '', like_options)
  end
end