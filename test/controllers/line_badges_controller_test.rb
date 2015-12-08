require 'test_helper'

class LineBadgesControllerTest < ActionController::TestCase
  setup do
    @line_badge = line_badges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_badges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_badge" do
    assert_difference('LineBadge.count') do
      post :create, line_badge: { badge_id: @line_badge.badge_id, user_id: @line_badge.user_id }
    end

    assert_redirected_to line_badge_path(assigns(:line_badge))
  end

  test "should show line_badge" do
    get :show, id: @line_badge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_badge
    assert_response :success
  end

  test "should update line_badge" do
    patch :update, id: @line_badge, line_badge: { badge_id: @line_badge.badge_id, user_id: @line_badge.user_id }
    assert_redirected_to line_badge_path(assigns(:line_badge))
  end

  test "should destroy line_badge" do
    assert_difference('LineBadge.count', -1) do
      delete :destroy, id: @line_badge
    end

    assert_redirected_to line_badges_path
  end
end
