require 'test_helper'

class SubsectionsControllerTest < ActionController::TestCase
  setup do
    @subsection = subsections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subsections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subsection" do
    assert_difference('Subsection.count') do
      post :create, subsection: { name: @subsection.name, section_id: @subsection.section_id }
    end

    assert_redirected_to subsection_path(assigns(:subsection))
  end

  test "should show subsection" do
    get :show, id: @subsection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subsection
    assert_response :success
  end

  test "should update subsection" do
    patch :update, id: @subsection, subsection: { name: @subsection.name, section_id: @subsection.section_id }
    assert_redirected_to subsection_path(assigns(:subsection))
  end

  test "should destroy subsection" do
    assert_difference('Subsection.count', -1) do
      delete :destroy, id: @subsection
    end

    assert_redirected_to subsections_path
  end
end
