class UsersController  < ApplicationController
  before_filter :authenticate_inviter!, :only => [:new, :create]


  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def new
    @user = User.new

  end

  def edit
    @user = User.find(params[:id])
    @user.build_profile if @user.profile.nil?

        end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def assignleaves
    if request.get?
      @user = User.find(params[:user_id])
@user.leave_details.build
    elsif request.post?
      if @user.update_attributes(params[:user])
	p "asdasd"	
      end
    end
 end

  def profile
  @user = User.find(params[:user_id])
    if request.post?
      respond_to do |format|
        if @user.update_attributes(params[:user])
          format.html { redirect_to profile_path(@user), notice: 'Profile was successfully created.' }
    else
          format.html { render action: "profile" }
        end
      end
    end
   end
   end

