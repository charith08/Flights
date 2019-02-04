require 'test_helper'

class SeatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @seat = seats(:one)
  end

  test "should get index" do
    get seats_url
    assert_response :success
  end

  test "should get new" do
    get new_seat_url
    assert_response :success
  end

  test "should create seat" do
    assert_difference('Seat.count') do
      post seats_url, params: { seat: { class_id: @seat.class_id, class_pnr: @seat.class_pnr, row: @seat.row, seats_in_row: @seat.seats_in_row, spnr: @seat.spnr } }
    end

    assert_redirected_to seat_url(Seat.last)
  end

  test "should show seat" do
    get seat_url(@seat)
    assert_response :success
  end

  test "should get edit" do
    get edit_seat_url(@seat)
    assert_response :success
  end

  test "should update seat" do
    patch seat_url(@seat), params: { seat: { class_id: @seat.class_id, class_pnr: @seat.class_pnr, row: @seat.row, seats_in_row: @seat.seats_in_row, spnr: @seat.spnr } }
    assert_redirected_to seat_url(@seat)
  end

  test "should destroy seat" do
    assert_difference('Seat.count', -1) do
      delete seat_url(@seat)
    end

    assert_redirected_to seats_url
  end
end
