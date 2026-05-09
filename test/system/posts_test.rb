require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "h1", text: "Posts"
  end

  test "should create post" do
    visit posts_url
    click_on "New post"

    fill_in "Body", with: @post.body
    fill_in "Parent post", with: @post.parent_post_id
    fill_in "Policy proposal", with: @post.policy_proposal_id
    fill_in "Post type", with: @post.post_type
    fill_in "Project", with: @post.project_id
    fill_in "Published at", with: @post.published_at
    fill_in "Scheduled at", with: @post.scheduled_at
    fill_in "Status", with: @post.status
    fill_in "Title", with: @post.title
    fill_in "User", with: @post.user_id
    fill_in "Visibility", with: @post.visibility
    click_on "Create Post"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  test "should update Post" do
    visit post_url(@post)
    click_on "Edit this post", match: :first

    fill_in "Body", with: @post.body
    fill_in "Parent post", with: @post.parent_post_id
    fill_in "Policy proposal", with: @post.policy_proposal_id
    fill_in "Post type", with: @post.post_type
    fill_in "Project", with: @post.project_id
    fill_in "Published at", with: @post.published_at.to_s
    fill_in "Scheduled at", with: @post.scheduled_at.to_s
    fill_in "Status", with: @post.status
    fill_in "Title", with: @post.title
    fill_in "User", with: @post.user_id
    fill_in "Visibility", with: @post.visibility
    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "should destroy Post" do
    visit post_url(@post)
    click_on "Destroy this post", match: :first

    assert_text "Post was successfully destroyed"
  end
end
