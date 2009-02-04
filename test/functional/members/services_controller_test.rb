require File.dirname(__FILE__) + '/../../test_helper'
require 'members/services_controller'

# Re-raise errors caught by the controller.
class Members::ServicesController; def rescue_action(e) raise e end; end

class Members::ServicesControllerTest < Test::Unit::TestCase
  def setup
    @controller = Members::ServicesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
