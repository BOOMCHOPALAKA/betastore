require 'test_helper'

class AdminProductsTest < ActionDispatch::IntegrationTest

  def test_manage
   #ASK ABOUT THIS WAY OF TESTING
    # visit "/admin/products"
    # save_and_open_page
    # product = products(:hat)
    # within("tr#product-#{product.id}") do
    #   click_on "Edit"

    visit "/admin/products"

    click_on "New Product"
    fill_in "Name", with: "Awesome"
    fill_in "Price", with: "9.99"
    click_on "Save"
    save_and_open_page
    click_on "Awesome"
    assert page.has_content?('9.99')
    click_on "Edit"

    fill_in "Price", with: "18.99"
    click_on "Save"

    click_on "Awesome"
    assert page.has_content?('18.99')
    click_on "Delete"

    refute page.has_content?('Awesome')
  end
end