require "application_system_test_case"

class PolicyProposalsTest < ApplicationSystemTestCase
  setup do
    @policy_proposal = policy_proposals(:one)
  end

  test "visiting the index" do
    visit policy_proposals_url
    assert_selector "h1", text: "Policy proposals"
  end

  test "should create policy proposal" do
    visit policy_proposals_url
    click_on "New policy proposal"

    fill_in "Background", with: @policy_proposal.background
    fill_in "Expected effect", with: @policy_proposal.expected_effect
    fill_in "Owner", with: @policy_proposal.owner_id
    fill_in "Pilot plan", with: @policy_proposal.pilot_plan
    fill_in "Problem", with: @policy_proposal.problem
    fill_in "Proposal", with: @policy_proposal.proposal
    fill_in "Related project", with: @policy_proposal.related_project_id
    fill_in "Risks", with: @policy_proposal.risks
    fill_in "Slug", with: @policy_proposal.slug
    fill_in "Status", with: @policy_proposal.status
    fill_in "Summary", with: @policy_proposal.summary
    fill_in "System outline", with: @policy_proposal.system_outline
    fill_in "Target users", with: @policy_proposal.target_users
    fill_in "Title", with: @policy_proposal.title
    fill_in "Visibility", with: @policy_proposal.visibility
    click_on "Create Policy proposal"

    assert_text "Policy proposal was successfully created"
    click_on "Back"
  end

  test "should update Policy proposal" do
    visit policy_proposal_url(@policy_proposal)
    click_on "Edit this policy proposal", match: :first

    fill_in "Background", with: @policy_proposal.background
    fill_in "Expected effect", with: @policy_proposal.expected_effect
    fill_in "Owner", with: @policy_proposal.owner_id
    fill_in "Pilot plan", with: @policy_proposal.pilot_plan
    fill_in "Problem", with: @policy_proposal.problem
    fill_in "Proposal", with: @policy_proposal.proposal
    fill_in "Related project", with: @policy_proposal.related_project_id
    fill_in "Risks", with: @policy_proposal.risks
    fill_in "Slug", with: @policy_proposal.slug
    fill_in "Status", with: @policy_proposal.status
    fill_in "Summary", with: @policy_proposal.summary
    fill_in "System outline", with: @policy_proposal.system_outline
    fill_in "Target users", with: @policy_proposal.target_users
    fill_in "Title", with: @policy_proposal.title
    fill_in "Visibility", with: @policy_proposal.visibility
    click_on "Update Policy proposal"

    assert_text "Policy proposal was successfully updated"
    click_on "Back"
  end

  test "should destroy Policy proposal" do
    visit policy_proposal_url(@policy_proposal)
    click_on "Destroy this policy proposal", match: :first

    assert_text "Policy proposal was successfully destroyed"
  end
end
