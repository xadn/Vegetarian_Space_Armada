class Members::DestroyersController < Members::MembersController
  
  before_filter :find_destroyer, :only => [:show, :edit, :update, :destroy]
  
  DESTROYERS_PER_PAGE = 4
  
  private 
  
    def namespaced_url(component=nil)
      members_destroyers_url(component)
    end
  
    def find_destroyer
      @destroyer = Destroyer.find(params[:id])
    end
  
  public
  
    def index
      @destroyers = (Destroyer.find_all_by_user_id(current_user.id)).paginate(:order => 'created_at ASC',:page => params[:page], :per_page => DESTROYERS_PER_PAGE)
    end
    
    def show
      respond_to do |format|
        format.html
        format.xml {render :xml => @destroyer }
      end
    end

    def new
      @destroyer = Destroyer.new
    end
  
    def create
    	params[:destroyer][:user_id] = current_user.id
      @destroyer = Destroyer.new(params[:destroyer])
      @destroyer.creator = current_user
      if @destroyer.save
        flash[:notice] = "Successfully created destroyer."
        redirect_to members_root_url
      else
      	flash[:error] = "Could not create game" 
        render :action => 'new'
      end
    end

    def edit
    end

    def update
    	@destroyer.creator = current_user
      if @destroyer.update_attributes(params[:destroyer])
        flash[:notice] = "Successfully updated destroyer."
        redirect_to members_root_url
      else
        render :action => 'edit'
      end
    end

    def destroy
      @destroyer.destroy
      flash[:notice] = "Successfully destroyed destroyer."
      redirect_to members_root_url
    end
    
end
