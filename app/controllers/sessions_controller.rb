class SessionsController <ApplicationController 
  
  def new 
    @user = User.new
  end
  
  
  def create 
    if params[:user]
    @user = User.find_by(name: params[:user][:name])
    @user = @user.try(:authenticate, params[:user][:password])
    # if @user 
      # raise params.inspect
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      # end
    else
      redirect_to(controller: 'sessions', action: 'new')
    end
    
	 end
	 

  
end