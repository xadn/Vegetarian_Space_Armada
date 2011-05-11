class DestroyersController < ApplicationController

before_filter :find_destroyer, :only => [:show]

DESTROYERS_PER_PAGE = 4

private 

  def namespaced_url(component=nil)
    destroyers_url(component)
  end

  def find_destroyer
    @destroyer = Destroyer.find(params[:id])
  end

public   

def index
  @total_destroyers = Destroyer.count
  @destroyers = Destroyer.paginate(:order => 'created_at DESC',:page => params[:page], :per_page => DESTROYERS_PER_PAGE)
  respond_to do |format|
    format.html
    format.xml {render :xml => @destroyers }
  end
end

def show
  #@destroyer = Destroyer.find(params[:id])
  respond_to do |format|
    format.html
    format.xml {render :xml => @destroyer }
  end
end
  # def index
  #   @destroyers = Destroyer.paginate_by_creator_id current_user.id, :order => 'created_at DESC',:page => params[:page], :per_page => DESTROYERS_PER_PAGE
  #   respond_to do |format|
  #     format.html
  #     format.xml {render :xml => @destroyers }
  #   end
  # end

  # def show
    # respond_to do |format|
    #   format.html
    #   format.xml {render :xml => @destroyer }
    # end
  # end

  end

