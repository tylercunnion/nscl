require File.dirname(__FILE__) + '/../../test_helper'
require 'events/convention_controller'

# Re-raise errors caught by the controller.
class Events::ConventionController; def rescue_action(e) raise e end; end

class Events::ConventionControllerTest < Test::Unit::TestCase
  def setup
    @controller = Events::ConventionController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
