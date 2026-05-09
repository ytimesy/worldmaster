require "application_system_test_case"

class PostingQueueItemsTest < ApplicationSystemTestCase
  setup do
    @posting_queue_item = posting_queue_items(:one)
  end

  test "visiting the index" do
    visit posting_queue_items_url
    assert_selector "h1", text: "Posting queue items"
  end

  test "should create posting queue item" do
    visit posting_queue_items_url
    click_on "New posting queue item"

    fill_in "Position", with: @posting_queue_item.position
    fill_in "Post", with: @posting_queue_item.post_id
    fill_in "Posting queue", with: @posting_queue_item.posting_queue_id
    fill_in "Published at", with: @posting_queue_item.published_at
    fill_in "Scheduled at", with: @posting_queue_item.scheduled_at
    fill_in "Status", with: @posting_queue_item.status
    click_on "Create Posting queue item"

    assert_text "Posting queue item was successfully created"
    click_on "Back"
  end

  test "should update Posting queue item" do
    visit posting_queue_item_url(@posting_queue_item)
    click_on "Edit this posting queue item", match: :first

    fill_in "Position", with: @posting_queue_item.position
    fill_in "Post", with: @posting_queue_item.post_id
    fill_in "Posting queue", with: @posting_queue_item.posting_queue_id
    fill_in "Published at", with: @posting_queue_item.published_at.to_s
    fill_in "Scheduled at", with: @posting_queue_item.scheduled_at.to_s
    fill_in "Status", with: @posting_queue_item.status
    click_on "Update Posting queue item"

    assert_text "Posting queue item was successfully updated"
    click_on "Back"
  end

  test "should destroy Posting queue item" do
    visit posting_queue_item_url(@posting_queue_item)
    click_on "Destroy this posting queue item", match: :first

    assert_text "Posting queue item was successfully destroyed"
  end
end
