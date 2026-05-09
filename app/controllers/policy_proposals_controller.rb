class PolicyProposalsController < ApplicationController
  before_action :set_policy_proposal, only: %i[ show edit update destroy ]

  # GET /policy_proposals or /policy_proposals.json
  def index
    @policy_proposals = PolicyProposal.all
  end

  # GET /policy_proposals/1 or /policy_proposals/1.json
  def show
  end

  # GET /policy_proposals/new
  def new
    @policy_proposal = PolicyProposal.new
  end

  # GET /policy_proposals/1/edit
  def edit
  end

  # POST /policy_proposals or /policy_proposals.json
  def create
    @policy_proposal = PolicyProposal.new(policy_proposal_params)

    respond_to do |format|
      if @policy_proposal.save
        format.html { redirect_to @policy_proposal, notice: "Policy proposal was successfully created." }
        format.json { render :show, status: :created, location: @policy_proposal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @policy_proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /policy_proposals/1 or /policy_proposals/1.json
  def update
    respond_to do |format|
      if @policy_proposal.update(policy_proposal_params)
        format.html { redirect_to @policy_proposal, notice: "Policy proposal was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @policy_proposal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @policy_proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /policy_proposals/1 or /policy_proposals/1.json
  def destroy
    @policy_proposal.destroy!

    respond_to do |format|
      format.html { redirect_to policy_proposals_path, notice: "Policy proposal was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_policy_proposal
      @policy_proposal = PolicyProposal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def policy_proposal_params
      params.require(:policy_proposal).permit(:owner_id, :related_project_id, :title, :slug, :summary, :background, :problem, :proposal, :target_users, :system_outline, :expected_effect, :risks, :pilot_plan, :status, :visibility)
    end
end
