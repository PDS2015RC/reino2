require 'test_helper'

class BadgesControllerTest < ActionController::TestCase
  setup do
    @badge = badges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:badges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create badge" do
    assert_difference('Badge.count') do
      post :create, badge: { description: @badge.description, earner_email: @badge.earner_email, img_url: @badge.img_url, issued_on: @badge.issued_on, issuer_organization: @badge.issuer_organization, issuer_url: @badge.issuer_url, name: @badge.name }
    end

    assert_redirected_to badge_path(assigns(:badge))
  end

  test "should show badge" do
    get :show, id: @badge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @badge
    assert_response :success
  end

  test "should update badge" do
    patch :update, id: @badge, badge: { description: @badge.description, earner_email: @badge.earner_email, img_url: @badge.img_url, issued_on: @badge.issued_on, issuer_organization: @badge.issuer_organization, issuer_url: @badge.issuer_url, name: @badge.name }
    assert_redirected_to badge_path(assigns(:badge))
  end

  test "should destroy badge" do
    assert_difference('Badge.count', -1) do
      delete :destroy, id: @badge
    end

    assert_redirected_to badges_path
  end
end
