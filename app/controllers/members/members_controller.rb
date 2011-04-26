class Members::MembersController < ApplicationController
  
  before_filter :require_user

  filter_access_to :all
  filter_access_to [:show, :update, :delete], :attribute_check => true

  DESTROYERS_PER_PAGE = 4
  
  def index
   	@total_destroyers = Destroyer.count
  	@destroyers = Destroyer.paginate(:order => 'created_at DESC',:page => params[:page], :per_page => DESTROYERS_PER_PAGE)
    render
  end
  
  protected

    def permission_denied
      flash[:error] = "You do not have access to #{request.path}."
      respond_to do |format|
        format.html { redirect_to root_url }
        format.xml { head :unauthorized }
        format.js { head :unauthorized }
      end
    end
  
end
