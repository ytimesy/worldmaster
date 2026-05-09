require "application_system_test_case"

class PostingQueuesTest < ApplicationSystemTestCase
  setup do
    @posting_queue = posting_queues(:one)
  end

  test "visiting the index" do
    visit posting_queues_url
    assert_selector "h1", text: "Posting queues"
  end

  test "should create posting queue" do
    visit posting_queues_url
    click_on "New posting queue"

    fill_in "Interval minutes", with: @posting_queue.interval_minutes
    fill_in "Next run at", with: @posting_queue.next_run_at
    fill_in "Start at", with: @posting_queue.start_at
    fill_in "Status", with: @posting_queue.status
    fill_in "Title", with: @posting_queue.title
    fill_in "User", with: @posting_queue.user_id
    click_on "Create Posting queue"

    assert_text "Posting queue was successfully created"
    click_on "Back"
  end

  test "should update Posting queue" do
    visit posting_queue_url(@posting_queue)
    click_on "Edit this posting queue", match: :first

    fill_in "Interval minutes", with: @posting_queue.interval_minutes
    fill_in "Next run at", with: @posting_queue.next_run_at.to_s
    fill_in "Start at", with: @posting_queue.start_at.to_s
    fill_in "Status", with: @posting_queue.status
    fill_in "Title", with: @posting_queue.title
    fill_in "User", with: @posting_queue.user_id
    click_on "Update Posting queue"

    assert_text "Posting queue was successfully updated"
    click_on "Back"
  end

  test "should destroy Posting queue" do
    visit posting_queue_url(@posting_queue)
    click_on "Destroy this posting queue", match: :first

    assert_text "Posting queue was successfully destroyed"
  end
end
