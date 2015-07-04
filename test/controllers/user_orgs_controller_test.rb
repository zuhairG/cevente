require 'test_helper'

class UserOrgsControllerTest < ActionController::TestCase
  setup do
    @user_org = user_orgs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_orgs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_org" do
    assert_difference('UserOrg.count') do
      post :create, user_org: { organization_id: @user_org.organization_id, user_id: @user_org.user_id }
    end

    assert_redirected_to user_org_path(assigns(:user_org))
  end

  test "should show user_org" do
    get :show, id: @user_org
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_org
    assert_response :success
  end

  test "should update user_org" do
    patch :update, id: @user_org, user_org: { organization_id: @user_org.organization_id, user_id: @user_org.user_id }
    assert_redirected_to user_org_path(assigns(:user_org))
  end

  test "should destroy user_org" do
    assert_difference('UserOrg.count', -1) do
      delete :destroy, id: @user_org
    end

    assert_redirected_to user_orgs_path
  end
end
