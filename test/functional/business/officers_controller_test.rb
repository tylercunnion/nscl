require File.dirname(__FILE__) + '/../../test_helper'
require 'business/officers_controller'

# Re-raise errors caught by the controller.
class Business::OfficersController; def rescue_action(e) raise e end; end

class Business::OfficersControllerTest < Test::Unit::TestCase
  def setup
    @controller = Business::OfficersController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
