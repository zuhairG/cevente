class UsersController < ApplicatioController
  def show
    @user = User.find(params[:id])
  end

end
