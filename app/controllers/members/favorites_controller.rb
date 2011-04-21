class Members::FavoritesController < Members::MembersController
  
  FAVORITES_PER_PAGE = 5
  
  def index
    @favorites = current_user.favorites.paginate(:order => 'created_at ASC',:page => params[:page], :per_page => FAVORITES_PER_PAGE, :include => :destroyer)

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
        format.html { redirect_to :back }
        format.xml  { render :xml => @favorite, :status => :created, :location => @favorite }
        format.js
       else
        format.html { redirect_to(:back, :notice => 'Unable to save favorite') }
        format.xml  { render :xml => @favorite.errors, :status => :unprocessable_entity }
        format.js
       end
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @destroyer = @favorite.destroyer
    @favorite.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { head :ok }
      format.js
    end
  end
end
