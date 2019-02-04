require "application_system_test_case"

class SeatsTest < ApplicationSystemTestCase
  setup do
    @seat = seats(:one)
  end

  test "visiting the index" do
    visit seats_url
    assert_selector "h1", text: "Seats"
  end

  test "creating a Seat" do
    visit seats_url
    click_on "New Seat"

    fill_in "Class", with: @seat.class_id
    fill_in "Class pnr", with: @seat.class_pnr
    fill_in "Row", with: @seat.row
    fill_in "Seats in row", with: @seat.seats_in_row
    fill_in "Spnr", with: @seat.spnr
    click_on "Create Seat"

    assert_text "Seat was successfully created"
    click_on "Back"
  end

  test "updating a Seat" do
    visit seats_url
    click_on "Edit", match: :first

    fill_in "Class", with: @seat.class_id
    fill_in "Class pnr", with: @seat.class_pnr
    fill_in "Row", with: @seat.row
    fill_in "Seats in row", with: @seat.seats_in_row
    fill_in "Spnr", with: @seat.spnr
    click_on "Update Seat"

    assert_text "Seat was successfully updated"
    click_on "Back"
  end

  test "destroying a Seat" do
    visit seats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Seat was successfully destroyed"
  end
end
