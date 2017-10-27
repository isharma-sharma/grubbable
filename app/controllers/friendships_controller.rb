class FriendshipsController < OpenReadController
  before_action :set_friendship, only: [:show, :update, :destroy]

  # GET /friendships
  def index
    @friendships = Friendship.all

    render json: @friendships
  end

  # GET /friendships/1
  def show
      @friendship = friendships.find(params[:id])
    render json: @friendship
  end

  # POST /friendships
  def create

    @friendship = current_user.friendships.create(friendship_params)
    # @friendship = current_user.friendships.build
    # @friendship.friend_id = params[:friend_id]
    # @friendship.user_id = current_user.id

    if @friendship.save
      render json: @friendship, status: :created, location: @friendship
    else
      render json: @friendship.errors, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /friendships/1
  def update
    if @friendship.update(friendship_params)
      render json: @friendship
    else
      render json: @friendship.errors, status: :unprocessable_entity
    end
  end

  # DELETE /friendships/1
  def destroy
    @friendship.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def friendship_params
      params.require(:friendship).permit(:friend_id, :user_id)
    end
end
