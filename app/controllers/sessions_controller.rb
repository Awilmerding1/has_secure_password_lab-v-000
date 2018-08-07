class SessionsController <ApplicationController 
  
  def new 
     @user = User.new
  end
  
  
  def create 
    @user = User.find_by(name: params[:user][:name])
    @user = @user.try(:authenticate, params[:user][:password])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to(controller: 'sessions', action: 'new')
    end
	 end
	 

  
end
