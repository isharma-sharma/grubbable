# frozen_string_literal: true
class UsersController < ProtectedController
  skip_before_action :authenticate, only: [:signup, :signin]

  # POST '/sign-up'
  def signup
    user = User.create(user_creds)
    if user.valid?
      render json: user, status: :created
    else
      render json: user.errors, status: :bad_request
    end
  end

  # POST '/sign-in'
  def signin
    creds = user_creds
    if (user = User.authenticate creds[:email],
                                 creds[:password])
      render json: user, serializer: UserLoginSerializer, root: 'user'
    else
      head :unauthorized
    end
  end

  # DELETE '/sign-out/1'
  def signout
    if current_user == User.find(params[:id])
      current_user.logout
      head :no_content
    else
      head :unauthorized
    end
  end

  # PATCH '/change-password/:id'
  def changepw
    if !current_user.authenticate(pw_creds[:old]) ||
       (current_user.password = pw_creds[:new]).blank? ||
       !current_user.save
      head :bad_request
    else
      head :no_content
    end
  end


  def index
    @users = User.all
    @users = @users.where.not(id: current_user)
   render json: @users
  end


 def show
 if @user = User.find_by(name: params[:id])
    render json: @user
    binding.pry
  else @user = User.find(params[:id])
    render json: @user
  end
end

  def update
   @user = User.find(params[:id])
   if @user.update(user_creds)
    render json: @user
else
  render json: @user.errors, status: :unprocessable_entity
end
end

  private

  def user_creds
    params.require(:credentials)
       .permit(:name, :email, :password, :password_confirmation, :age, :address)
  end

  def pw_creds
    params.require(:passwords)
          .permit(:old, :new)
  end

  private :user_creds, :pw_creds
end
