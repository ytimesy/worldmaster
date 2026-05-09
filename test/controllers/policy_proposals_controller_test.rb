require "test_helper"

class PolicyProposalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @policy_proposal = policy_proposals(:one)
  end

  test "should get index" do
    get policy_proposals_url
    assert_response :success
  end

  test "should get new" do
    get new_policy_proposal_url
    assert_response :success
  end

  test "should create policy_proposal" do
    assert_difference("PolicyProposal.count") do
      post policy_proposals_url, params: { policy_proposal: { background: @policy_proposal.background, expected_effect: @policy_proposal.expected_effect, owner_id: @policy_proposal.owner_id, pilot_plan: @policy_proposal.pilot_plan, problem: @policy_proposal.problem, proposal: @policy_proposal.proposal, related_project_id: @policy_proposal.related_project_id, risks: @policy_proposal.risks, slug: @policy_proposal.slug, status: @policy_proposal.status, summary: @policy_proposal.summary, system_outline: @policy_proposal.system_outline, target_users: @policy_proposal.target_users, title: @policy_proposal.title, visibility: @policy_proposal.visibility } }
    end

    assert_redirected_to policy_proposal_url(PolicyProposal.last)
  end

  test "should show policy_proposal" do
    get policy_proposal_url(@policy_proposal)
    assert_response :success
  end

  test "should get edit" do
    get edit_policy_proposal_url(@policy_proposal)
    assert_response :success
  end

  test "should update policy_proposal" do
    patch policy_proposal_url(@policy_proposal), params: { policy_proposal: { background: @policy_proposal.background, expected_effect: @policy_proposal.expected_effect, owner_id: @policy_proposal.owner_id, pilot_plan: @policy_proposal.pilot_plan, problem: @policy_proposal.problem, proposal: @policy_proposal.proposal, related_project_id: @policy_proposal.related_project_id, risks: @policy_proposal.risks, slug: @policy_proposal.slug, status: @policy_proposal.status, summary: @policy_proposal.summary, system_outline: @policy_proposal.system_outline, target_users: @policy_proposal.target_users, title: @policy_proposal.title, visibility: @policy_proposal.visibility } }
    assert_redirected_to policy_proposal_url(@policy_proposal)
  end

  test "should destroy policy_proposal" do
    assert_difference("PolicyProposal.count", -1) do
      delete policy_proposal_url(@policy_proposal)
    end

    assert_redirected_to policy_proposals_url
  end
end
