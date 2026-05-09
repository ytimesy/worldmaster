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
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference("Post.count") do
      post posts_url, params: { post: { body: @post.body, parent_post_id: @post.parent_post_id, policy_proposal_id: @post.policy_proposal_id, post_type: @post.post_type, project_id: @post.project_id, published_at: @post.published_at, scheduled_at: @post.scheduled_at, status: @post.status, title: @post.title, user_id: @post.user_id, visibility: @post.visibility } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: { body: @post.body, parent_post_id: @post.parent_post_id, policy_proposal_id: @post.policy_proposal_id, post_type: @post.post_type, project_id: @post.project_id, published_at: @post.published_at, scheduled_at: @post.scheduled_at, status: @post.status, title: @post.title, user_id: @post.user_id, visibility: @post.visibility } }
    assert_redirected_to post_url(@post)
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
