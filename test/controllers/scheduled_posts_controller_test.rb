require "test_helper"

class ScheduledPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scheduled_post = scheduled_posts(:one)
  end

  test "should get index" do
    get scheduled_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_scheduled_post_url
    assert_response :success
  end

  test "should create scheduled_post" do
    assert_difference("ScheduledPost.count") do
      post scheduled_posts_url, params: { scheduled_post: { error_message: @scheduled_post.error_message, post_id: @scheduled_post.post_id, posting_queue_id: @scheduled_post.posting_queue_id, scheduled_at: @scheduled_post.scheduled_at, status: @scheduled_post.status, user_id: @scheduled_post.user_id } }
    end

    assert_redirected_to scheduled_post_url(ScheduledPost.last)
  end

  test "should show scheduled_post" do
    get scheduled_post_url(@scheduled_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_scheduled_post_url(@scheduled_post)
    assert_response :success
  end

  test "should update scheduled_post" do
    patch scheduled_post_url(@scheduled_post), params: { scheduled_post: { error_message: @scheduled_post.error_message, post_id: @scheduled_post.post_id, posting_queue_id: @scheduled_post.posting_queue_id, scheduled_at: @scheduled_post.scheduled_at, status: @scheduled_post.status, user_id: @scheduled_post.user_id } }
    assert_redirected_to scheduled_post_url(@scheduled_post)
  end

  test "should destroy scheduled_post" do
    assert_difference("ScheduledPost.count", -1) do
      delete scheduled_post_url(@scheduled_post)
    end

    assert_redirected_to scheduled_posts_url
  end
end
