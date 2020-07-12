require "application_system_test_case"

class PostCatsTest < ApplicationSystemTestCase
  setup do
    @post_cat = post_cats(:one)
  end

  test "visiting the index" do
    visit post_cats_url
    assert_selector "h1", text: "Post Cats"
  end

  test "creating a Post cat" do
    visit post_cats_url
    click_on "New Post Cat"

    fill_in "Cat", with: @post_cat.cat_id
    fill_in "Post", with: @post_cat.post_id
    click_on "Create Post cat"

    assert_text "Post cat was successfully created"
    click_on "Back"
  end

  test "updating a Post cat" do
    visit post_cats_url
    click_on "Edit", match: :first

    fill_in "Cat", with: @post_cat.cat_id
    fill_in "Post", with: @post_cat.post_id
    click_on "Update Post cat"

    assert_text "Post cat was successfully updated"
    click_on "Back"
  end

  test "destroying a Post cat" do
    visit post_cats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post cat was successfully destroyed"
  end
end
