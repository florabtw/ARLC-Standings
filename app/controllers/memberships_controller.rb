class MembershipsController < ApplicationController
  before_action :authenticate
  before_action :set_membership, only: [:destroy]

  autocomplete :player, :username

  def new
    @team = Team.find(params[:team_id])
    @membership = @team.memberships.new
  end

  def create
    # lookup player if autocomplete wasn't used
    if params[:membership][:player_id].blank? then
      player = lookup_player
      player_id = player.id unless player.nil?
      params[:membership][:player_id] = player_id
    end

    @membership = Membership.new(membership_params)

    respond_to do |format|
      if @membership.save
        format.html { redirect_to @membership.team, notice: 'Membership was successfully created.' }
        format.json { render :show, status: :created, location: @membership }
      else
        @team = Team.find(params[:team_id])
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
    def set_membership
      @membership = Membership.find(params[:id])
    end

    def membership_params
      params.require(:membership).permit(:team_id, :player_id)
    end

    def lookup_player
      Player.where('lower(username) = ?', params[:membership][:player].downcase).first
    end
end
