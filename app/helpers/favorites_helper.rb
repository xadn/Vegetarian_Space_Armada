module FavoritesHelper
  
  def favorite_button(destroyer)
    if (favorite = destroyer.favorites.find(:first, params[:user_id] = current_user.id))
      render :partial => "/members/favorites/unfavorite_button", :locals => {:favorite => favorite}
     else
      render :partial => "/members/favorites/favorite_button", :locals => {:destroyer => destroyer}
    end
   end
   
end
