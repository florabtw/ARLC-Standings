class MembershipsController < ApplicationController
  before_action :authenticate
  before_action :set_membership, only: [:destroy]

  autocomplete :player, :username

  def new
    @team = Team.find(params[:team_id])
    @membership = @team.memberships.new
  end

  def create
    @membership = Membership.new(membership_params)

    respond_to do |format|
      if @membership.save
        format.html { redirect_to @membership.team, notice: 'Membership was successfully created.' }
        format.json { render :show, status: :created, location: @membership }
      else
        format.html { render :new }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    team = @membership.team
    @membership.destroy
    respond_to do |format|
      format.html { redirect_to team, notice: 'Membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership
      @membership = Membership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_params
      params.require(:membership).permit(:team_id, :player_id)
    end
end
