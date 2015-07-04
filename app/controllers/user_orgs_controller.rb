class UserOrgsController < ApplicationController
  before_action :set_user_org, only: [:show, :edit, :update, :destroy]

  # GET /user_orgs
  # GET /user_orgs.json
  def index
    @user_orgs = UserOrg.all
  end

  # GET /user_orgs/1
  # GET /user_orgs/1.json
  def show
  end

  # GET /user_orgs/new
  def new
    @user_org = UserOrg.new
  end

  # GET /user_orgs/1/edit
  def edit
  end

  # POST /user_orgs
  # POST /user_orgs.json
  def create
    @user_org = UserOrg.new(user_org_params)

    respond_to do |format|
      if @user_org.save
        format.html { redirect_to @user_org, notice: 'User org was successfully created.' }
        format.json { render :show, status: :created, location: @user_org }
      else
        format.html { render :new }
        format.json { render json: @user_org.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_orgs/1
  # PATCH/PUT /user_orgs/1.json
  def update
    respond_to do |format|
      if @user_org.update(user_org_params)
        format.html { redirect_to @user_org, notice: 'User org was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_org }
      else
        format.html { render :edit }
        format.json { render json: @user_org.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_orgs/1
  # DELETE /user_orgs/1.json
  def destroy
    @user_org.destroy
    respond_to do |format|
      format.html { redirect_to user_orgs_url, notice: 'User org was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_org
      @user_org = UserOrg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_org_params
      params.require(:user_org).permit(:user_id, :organization_id)
    end
end
