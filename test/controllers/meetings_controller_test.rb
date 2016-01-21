require 'test_helper'

class MeetingsControllerTest < ActionController::TestCase
  setup do
    @meeting = meetings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meetings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meeting" do
    assert_difference('Meeting.count') do
      post :create, meeting: { date: @meeting.date, end_time: @meeting.end_time, name: @meeting.name, organiser_id: @meeting.organiser_id, postcode: @meeting.postcode, reason: @meeting.reason, start_time: @meeting.start_time, state: @meeting.state, street: @meeting.street, suburb: @meeting.suburb }
    end

    assert_redirected_to meeting_path(assigns(:meeting))
  end

  test "should show meeting" do
    get :show, id: @meeting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meeting
    assert_response :success
  end

  test "should update meeting" do
    patch :update, id: @meeting, meeting: { date: @meeting.date, end_time: @meeting.end_time, name: @meeting.name, organiser_id: @meeting.organiser_id, postcode: @meeting.postcode, reason: @meeting.reason, start_time: @meeting.start_time, state: @meeting.state, street: @meeting.street, suburb: @meeting.suburb }
    assert_redirected_to meeting_path(assigns(:meeting))
  end

  test "should destroy meeting" do
    assert_difference('Meeting.count', -1) do
      delete :destroy, id: @meeting
    end

    assert_redirected_to meetings_path
  end
end
