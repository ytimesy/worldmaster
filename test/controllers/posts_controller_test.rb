require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    log_in_as(@post.user)
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    log_in_as(@post.user)

    assert_difference("Post.count") do
      post posts_url, params: { post: { body: "New public post", parent_post_id: nil, policy_proposal_id: @post.policy_proposal_id, post_type: @post.post_type, project_id: @post.project_id, scheduled_at: @post.scheduled_at, status: @post.status, title: "New post", visibility: @post.visibility } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@post.user)
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    log_in_as(@post.user)
    patch post_url(@post), params: { post: { body: "Updated body", parent_post_id: nil, policy_proposal_id: @post.policy_proposal_id, post_type: @post.post_type, project_id: @post.project_id, scheduled_at: @post.scheduled_at, status: @post.status, title: @post.title, visibility: @post.visibility } }
    assert_redirected_to post_url(@post)
  end

  test "should destroy post" do
    log_in_as(@post.user)

    assert_difference("Post.count", -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
