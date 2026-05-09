require "test_helper"

class PostingQueuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @posting_queue = posting_queues(:one)
  end

  test "should get index" do
    get posting_queues_url
    assert_response :success
  end

  test "should get new" do
    get new_posting_queue_url
    assert_response :success
  end

  test "should create posting_queue" do
    assert_difference("PostingQueue.count") do
      post posting_queues_url, params: { posting_queue: { interval_minutes: @posting_queue.interval_minutes, next_run_at: @posting_queue.next_run_at, start_at: @posting_queue.start_at, status: @posting_queue.status, title: @posting_queue.title, user_id: @posting_queue.user_id } }
    end

    assert_redirected_to posting_queue_url(PostingQueue.last)
  end

  test "should show posting_queue" do
    get posting_queue_url(@posting_queue)
    assert_response :success
  end

  test "should get edit" do
    get edit_posting_queue_url(@posting_queue)
    assert_response :success
  end

  test "should update posting_queue" do
    patch posting_queue_url(@posting_queue), params: { posting_queue: { interval_minutes: @posting_queue.interval_minutes, next_run_at: @posting_queue.next_run_at, start_at: @posting_queue.start_at, status: @posting_queue.status, title: @posting_queue.title, user_id: @posting_queue.user_id } }
    assert_redirected_to posting_queue_url(@posting_queue)
  end

  test "should destroy posting_queue" do
    assert_difference("PostingQueue.count", -1) do
      delete posting_queue_url(@posting_queue)
    end

    assert_redirected_to posting_queues_url
  end
end
