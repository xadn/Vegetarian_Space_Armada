class Members::UserController < Members::MembersController

  before_filter :find_user, :only => [:show, :edit, :update, :destroy]

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @user }
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:success] = 'User was successfully updated.'
        format.html { redirect_to admin_user_url(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @user.destroy
        flash[:success] = 'User was successfully destroyed.'        
        format.html { redirect_to admin_users_path }
        format.xml  { head :ok }
      else
        flash[:error] = 'User could not be destroyed.'
        format.html { redirect_to admin_user_url(@user) }
        format.xml  { head :unprocessable_entity }
      end
    end
  end
  
  private
  
    def find_user
      @user = current_user
    end

end