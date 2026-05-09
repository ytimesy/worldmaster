require "application_system_test_case"

class SolutionsTest < ApplicationSystemTestCase
  setup do
    @solution = solutions(:one)
  end

  test "visiting the index" do
    visit solutions_url
    assert_selector "h1", text: "Solutions"
  end

  test "should create solution" do
    visit solutions_url
    click_on "New solution"

    fill_in "Category", with: @solution.category
    fill_in "Evidence", with: @solution.evidence
    fill_in "Impact", with: @solution.impact
    check "Published" if @solution.published
    fill_in "Summary", with: @solution.summary
    fill_in "Title", with: @solution.title
    fill_in "Url", with: @solution.url
    click_on "Create Solution"

    assert_text "Solution was successfully created"
    click_on "Back"
  end

  test "should update Solution" do
    visit solution_url(@solution)
    click_on "Edit this solution", match: :first

    fill_in "Category", with: @solution.category
    fill_in "Evidence", with: @solution.evidence
    fill_in "Impact", with: @solution.impact
    check "Published" if @solution.published
    fill_in "Summary", with: @solution.summary
    fill_in "Title", with: @solution.title
    fill_in "Url", with: @solution.url
    click_on "Update Solution"

    assert_text "Solution was successfully updated"
    click_on "Back"
  end

  test "should destroy Solution" do
    visit solution_url(@solution)
    click_on "Destroy this solution", match: :first

    assert_text "Solution was successfully destroyed"
  end
end
