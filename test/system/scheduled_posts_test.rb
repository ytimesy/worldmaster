require "application_system_test_case"

class ScheduledPostsTest < ApplicationSystemTestCase
  setup do
    @scheduled_post = scheduled_posts(:one)
  end

  test "visiting the index" do
    visit scheduled_posts_url
    assert_selector "h1", text: "Scheduled posts"
  end

  test "should create scheduled post" do
    visit scheduled_posts_url
    click_on "New scheduled post"

    fill_in "Error message", with: @scheduled_post.error_message
    fill_in "Post", with: @scheduled_post.post_id
    fill_in "Posting queue", with: @scheduled_post.posting_queue_id
    fill_in "Scheduled at", with: @scheduled_post.scheduled_at
    fill_in "Status", with: @scheduled_post.status
    fill_in "User", with: @scheduled_post.user_id
    click_on "Create Scheduled post"

    assert_text "Scheduled post was successfully created"
    click_on "Back"
  end

  test "should update Scheduled post" do
    visit scheduled_post_url(@scheduled_post)
    click_on "Edit this scheduled post", match: :first

    fill_in "Error message", with: @scheduled_post.error_message
    fill_in "Post", with: @scheduled_post.post_id
    fill_in "Posting queue", with: @scheduled_post.posting_queue_id
    fill_in "Scheduled at", with: @scheduled_post.scheduled_at.to_s
    fill_in "Status", with: @scheduled_post.status
    fill_in "User", with: @scheduled_post.user_id
    click_on "Update Scheduled post"

    assert_text "Scheduled post was successfully updated"
    click_on "Back"
  end

  test "should destroy Scheduled post" do
    visit scheduled_post_url(@scheduled_post)
    click_on "Destroy this scheduled post", match: :first

    assert_text "Scheduled post was successfully destroyed"
  end
end
