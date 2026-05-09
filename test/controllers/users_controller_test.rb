require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    log_in_as(@user)
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { avatar_url: "https://example.com/new.png", bio: "New bio", display_name: "New User", email: "new@example.com", password: "password", password_confirmation: "password", username: "new_user", website_url: "https://example.com/new" } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@user)
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    log_in_as(@user)
    patch user_url(@user), params: { user: { avatar_url: @user.avatar_url, bio: "Updated bio", display_name: @user.display_name, email: @user.email, username: @user.username, website_url: @user.website_url } }
    assert_redirected_to user_url(@user)
  end

  test "should not expose user destroy route" do
    log_in_as(@user)

    assert_no_difference("User.count") do
      delete user_url(users(:two))
    end

    assert_response :not_found
  end
end
