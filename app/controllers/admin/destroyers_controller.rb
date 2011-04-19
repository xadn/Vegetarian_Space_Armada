class Admin::DestroyersController < Admin::AdminController
  
  before_filter :find_destroyer, :only => [:show, :edit, :update, :destroy]
  
  private 
  
    def namespaced_url(component=nil)
      admin_destroyers_url(component)
    end
  
    def find_destroyer
      @destroyer = Destroyer.find(params[:id])
    end
  
  public
  
    def index
      @destroyers = Destroyer.all
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
      @destroyer = Destroyer.new(params[:destroyer])
      @destroyer.creator = current_user
      if @destroyer.save
        flash[:notice] = "Successfully created destroyer."
        redirect_to namespaced_url(@destroyer)
      else
        render :action => 'new'
      end
    end

    def edit
      respond_to do |format|
        format.html
        format.xml {render :xml => @destroyer }
      end
    end

    def update
      if @destroyer.update_attributes(params[:destroyer])
        flash[:notice] = "Successfully updated destroyer."
        redirect_to @destroyer
      else
        render :action => 'edit'
      end
    end

    def destroy
      @destroyer.destroy
      flash[:notice] = "Successfully destroyed destroyer."
      redirect_to namespaced_url
    end
    
end
