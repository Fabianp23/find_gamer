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
      image_tag "xbox_msg.png"
    else
      image_tag "psn_profile.png"
     end
  end

end
