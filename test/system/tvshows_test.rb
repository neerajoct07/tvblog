require "application_system_test_case"

class TvshowsTest < ApplicationSystemTestCase
  setup do
    @tvshow = tvshows(:one)
  end

  test "visiting the index" do
    visit tvshows_url
    assert_selector "h1", text: "Tvshows"
  end

  test "creating a Tvshow" do
    visit tvshows_url
    click_on "New Tvshow"

    fill_in "Name", with: @tvshow.name
    fill_in "Time", with: @tvshow.time
    click_on "Create Tvshow"

    assert_text "Tvshow was successfully created"
    click_on "Back"
  end

  test "updating a Tvshow" do
    visit tvshows_url
    click_on "Edit", match: :first

    fill_in "Name", with: @tvshow.name
    fill_in "Time", with: @tvshow.time
    click_on "Update Tvshow"

    assert_text "Tvshow was successfully updated"
    click_on "Back"
  end

  test "destroying a Tvshow" do
    visit tvshows_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tvshow was successfully destroyed"
  end
end
