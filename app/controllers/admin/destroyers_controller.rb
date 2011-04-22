class Admin::DestroyersController < Admin::AdminController

before_filter :find_destroyer, :only => [:show, :edit, :update, :destroy]
before_filter :set_return, :only => [:edit]

DESTROYERS_PER_PAGE = 4

private 

  def namespaced_url(component=nil)
    members_destroyers_url(component)
  end

  def find_destroyer
    @destroyer = Destroyer.find(params[:id])
  end
  
  def set_return
    session[:return_to] = request.referer
  end

public

  def index
    @destroyers = Destroyer.paginate_by_creator_id current_user.id, :order => 'created_at DESC',:page => params[:page], :per_page => DESTROYERS_PER_PAGE
    respond_to do |format|
      format.html
      format.xml {render :xml => @destroyers }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml {render :xml => @destroyer }
    end
  end

  def new
    @destroyer = Destroyer.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @destroyer }
    end
  end

  def create
    @destroyer = Destroyer.new(params[:destroyer])
    @destroyer.creator = current_user
    respond_to do |format|
      if @destroyer.save
        flash[:success] = 'Destroyer was successfully created.'
        format.html { redirect_to members_destroyer_path(@destroyer) }
        format.xml  { render :xml => @destroyer, :status => :created, :location => @destroyer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @destroyer.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update  
    respond_to do |format|
      if @destroyer.update_attributes(params[:destroyer])
        flash[:success] = 'Destroyer was successfully updated.'
        format.html { redirect_to members_destroyer_path(@destroyer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @destroyer.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy      
  	@favorites = Favorite.find_all_by_destroyer_id(@destroyer.id)    
    respond_to do |format|
      if @destroyer.destroy
      	@favorites.each do |f|
        		f.destroy
        end
        flash[:success] = 'Destroyer was successfully destroyed.'        
        format.html { redirect_to :back }
        format.xml  { head :ok }
      else
        flash[:error] = 'Destroyer could not be destroyed.'
        format.html { redirect_to :back }
        format.xml  { head :unprocessable_entity }
      end
    end
  end

end