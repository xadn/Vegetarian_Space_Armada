class DestroyersController < ApplicationController
	
	DESTROYERS_PER_PAGE = 10
  def index
    @destroyer = Destroyer.paginate(:order => 'created_at ASC',:page => params[:page], :per_page => DESTROYERS_PER_PAGE)
  end

  def show
    @destroyer = Destroyer.find(params[:id])
  end

  def new
    @destroyer = Destroyer.new
  end

  def create
    @destroyer = Destroyer.new(params[:destroyer])
    if @destroyer.save
      flash[:notice] = "Successfully created destroyer."
      redirect_to @destroyer
    else
      render :action => 'new'
    end
  end

  def edit
    @destroyer = Destroyer.find(params[:id])
  end

  def update
    @destroyer = Destroyer.find(params[:id])
    if @destroyer.update_attributes(params[:destroyer])
      flash[:notice] = "Successfully updated destroyer."
      redirect_to @destroyer
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @destroyer = Destroyer.find(params[:id])
    @destroyer.destroy
    flash[:notice] = "Successfully destroyed destroyer."
    redirect_to destroyers_url
  end
end
