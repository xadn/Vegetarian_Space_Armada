module FavoritesHelper
  
  def is_favorite?(destroyer)
    if (favorite = destroyer.favorites.find(:first, params[:user_id] = current_user.id))
       render :partial => "unfavorite_button", :locals => {:favorite => favorite}
     else
      render :partial => "favorite_button", :locals => {:destroyer => destroyer}
    end
   end
   
end
