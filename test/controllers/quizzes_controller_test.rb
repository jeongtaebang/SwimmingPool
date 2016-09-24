require 'test_helper'

class QuizzesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quizzes_index_url
    assert_response :success
  end

  test "should get create" do
    get quizzes_create_url
    assert_response :success
  end

  test "should get edit" do
    get quizzes_edit_url
    assert_response :success
  end

  test "should get update" do
    get quizzes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get quizzes_destroy_url
    assert_response :success
  end

end
