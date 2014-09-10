require 'test_helper'

class CreateSubscriptionTest < ActionDispatch::IntegrationTest

#SEE SLIDES http://pjb3.github.io/back-end-web-development/03_sql_models_routing_controllers/testing_controllers#13

#SLIDE 13
  # def test_create_subscription
  #   get "/"
  #   assert_response :success
  # end

#SLIDE 15
  # def test_create_subscription
  #   visit "/"
  #   assert page.has_content?("Find out when we go live")
  # end

#SLIDE 16
  def test_create_subscription
    visit "/"
    fill_in "Find out when we go live", with: 'test@example.com'
    click_on "Sign Up"
    #SAVE_AND_OPEN_PAGE opens up a working browser page
    #save_and_open_page
    assert page.has_content?('Subscription was successfully created.')
    assert_equal 'test@example.com', Subscription.last.email
  end

end