module DestroyersHelper
  
  def is_favorite?(destroyer)
    if destroyer.favorites.exists?(:user_id => current_user.id)
         link_to(image_tag("icon_small_star.png", :title => "unfavorite"), members_favorite_path(destroyer), :method => :delete)
       else
         link_to(image_tag("icon_small_star_inactive.png", :title => "favorite"))
       end
  end

end