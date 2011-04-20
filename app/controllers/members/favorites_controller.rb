class Members::FavoritesController < Members::MembersController
  
  def index
    @favorites = current_user.favorites

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @favorites }
    end
  end

  def create
    @favorite = Favorite.new(params[:favorite])
    @favorite.user = current_user

    respond_to do |format|
       if @favorite.save
        format.html { redirect_to(members_destroyers_url, :notice => 'Favorite was successfully created.') }
        format.xml  { render :xml => @favorite, :status => :created, :location => @favorite }
       else
        format.html { redirect_to(members_root_url, :notice => 'Unable to create favorite') }
        format.xml  { render :xml => @favorite.errors, :status => :unprocessable_entity }
       end
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy

    respond_to do |format|
      format.html { redirect_to members_root_url }
      format.xml  { head :ok }
    end
  end
end
