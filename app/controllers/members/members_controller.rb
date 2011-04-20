class Members::MembersController < ApplicationController
  before_filter :require_user

  filter_access_to :all

  DESTROYERS_PER_PAGE = 4
  
  def index
  	 @destroyers = Destroyer.paginate(:order => 'created_at ASC',:page => params[:page], :per_page => DESTROYERS_PER_PAGE)
    render
  end
  
  protected

    def permission_denied
      flash[:error] = "You do not have access to #{request.path}."
      respond_to do |format|
        format.html { redirect_to members_root_url }
        format.xml { head :unauthorized }
        format.js { head :unauthorized }
      end
    end
  
end
