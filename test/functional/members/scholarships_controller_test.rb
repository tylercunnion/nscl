require File.dirname(__FILE__) + '/../../test_helper'
require 'members/scholarships_controller'

# Re-raise errors caught by the controller.
class Members::ScholarshipsController; def rescue_action(e) raise e end; end

class Members::ScholarshipsControllerTest < Test::Unit::TestCase
  def setup
    @controller = Members::ScholarshipsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
