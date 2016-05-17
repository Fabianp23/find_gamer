module PostsHelper

  def headset_img(post)
    if post.microphone
      image_tag "headset.png"
    else
      image_tag "no_headset.png"
    end
  end

  def console_img(post)
    if post.console == "Xbox One" || post.console == "Xbox 360"
      link_to "https://account.xbox.com/en-US/Messages?gamerTag=#{post.gamertag}" , :target => '_blank' do
        image_tag "xbox_msg.png"
      end
    else
      link_to "https://my.playstation.com/#{post.gamertag}" , :target => '_blank' do
        image_tag "psn_profile.png"
        end
     end
  end

end
