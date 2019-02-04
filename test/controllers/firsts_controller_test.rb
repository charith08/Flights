require 'test_helper'

class FirstsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @first = firsts(:one)
  end

  test "should get index" do
    get firsts_url
    assert_response :success
  end

  test "should get new" do
    get new_first_url
    assert_response :success
  end

  test "should create first" do
    assert_difference('First.count') do
      post firsts_url, params: { first: { fcpnr: @first.fcpnr, row: @first.row, seats_in_row: @first.seats_in_row } }
    end

    assert_redirected_to first_url(First.last)
  end

  test "should show first" do
    get first_url(@first)
    assert_response :success
  end

  test "should get edit" do
    get edit_first_url(@first)
    assert_response :success
  end

  test "should update first" do
    patch first_url(@first), params: { first: { fcpnr: @first.fcpnr, row: @first.row, seats_in_row: @first.seats_in_row } }
    assert_redirected_to first_url(@first)
  end

  test "should destroy first" do
    assert_difference('First.count', -1) do
      delete first_url(@first)
    end

    assert_redirected_to firsts_url
  end
end
