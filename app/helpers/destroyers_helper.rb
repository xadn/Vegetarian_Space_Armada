module DestroyersHelper
  
  def is_favorite?(destroyer)
    if favorite = destroyer.favorites.find(:first, params[:user_id] = current_user.id)
      link_to(image_tag("icon_small_star.png", :title => "unfavorite"), members_favorite_path(:id => favorite.id), :method => :delete)
    else
      #link_to(image_tag("icon_small_star_inactive.png", :title => "favorite"), members_favorite_path, :action => 'create', :method => :post)
    end
  end

end