require File.dirname(__FILE__) + '/../../test_helper'
require 'business/documents_controller'

# Re-raise errors caught by the controller.
class Business::DocumentsController; def rescue_action(e) raise e end; end

class Business::DocumentsControllerTest < Test::Unit::TestCase
  def setup
    @controller = Business::DocumentsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
