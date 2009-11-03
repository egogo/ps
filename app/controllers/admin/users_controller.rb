class Admin::UsersController < Admin::BaseController
  def index
    @users = User.find(:all)
  end
  
  def update
    @user = User.find(params[:id])
    render :update do |page|
      if @user.update_attributes params[:user]
        page.visual_effect :highlight, "user_#{params[:id]}"
      else
        page.replace_html "#user_#{params[:id]} div.error", @user.errors.collect {|e| e.to_s}
      end
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @users_count = User.count(:all)
    @user.destroy if @users_count > 1
    render :update do |page|
        page.remove "user_#{params[:id]}" if @users_count > 1
    end
  end
end
