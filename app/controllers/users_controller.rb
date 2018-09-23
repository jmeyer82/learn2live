class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    # @users = User.all
    # render json: @users
    
    
    # Is scope called to be for?
    @users = nil
    if params[:search_role].present?
      # which scope to use
        if params[:search_role].downcase.include? "sharer"
          @users = User.sharer
        elsif params[:search_role].downcase.include? "seeker"
          @users = User.seeker
        end
    else
      @users = User.all
    end
      
    if params[:match_target].present? && params[:by_field].present?
      holder = select_column(params[:by_field])
      # findby_target = params[:by_field]
      # finby
      # @users = @users.find_by(findby_target, "%#{params[:match_target]}%")
      @users = @users.where(holder, "%#{params[:match_target]}%")
    else
      @users = User.all
    end
    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :profile_type, :roles, :education, :time, :description_roles, :description_education, :attributes_roles, :attributes_education, :skill_share, :match_target, :by_field, :donations_amounts, :search_role)
    end
    
    def select_search_column(blah)
      blah2 = blah + 'like ?'
    end
    
    
    # User.where(blah +' like ?', 'Studio Tecnico')
    # User.where('? LIKE ?', params[:by_field], "%#{params[:by_field]}%" )
    def select_column(blah)
      temp = blah + ' like ?' 
      result = temp 
    end
    
    
end
