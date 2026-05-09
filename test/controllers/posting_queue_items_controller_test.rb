require "test_helper"

class PostingQueueItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @posting_queue_item = posting_queue_items(:one)
  end

  test "should get index" do
    get posting_queue_items_url
    assert_response :success
  end

  test "should get new" do
    get new_posting_queue_item_url
    assert_response :success
  end

  test "should create posting_queue_item" do
    assert_difference("PostingQueueItem.count") do
      post posting_queue_items_url, params: { posting_queue_item: { position: @posting_queue_item.position, post_id: @posting_queue_item.post_id, posting_queue_id: @posting_queue_item.posting_queue_id, published_at: @posting_queue_item.published_at, scheduled_at: @posting_queue_item.scheduled_at, status: @posting_queue_item.status } }
    end

    assert_redirected_to posting_queue_item_url(PostingQueueItem.last)
  end

  test "should show posting_queue_item" do
    get posting_queue_item_url(@posting_queue_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_posting_queue_item_url(@posting_queue_item)
    assert_response :success
  end

  test "should update posting_queue_item" do
    patch posting_queue_item_url(@posting_queue_item), params: { posting_queue_item: { position: @posting_queue_item.position, post_id: @posting_queue_item.post_id, posting_queue_id: @posting_queue_item.posting_queue_id, published_at: @posting_queue_item.published_at, scheduled_at: @posting_queue_item.scheduled_at, status: @posting_queue_item.status } }
    assert_redirected_to posting_queue_item_url(@posting_queue_item)
  end

  test "should destroy posting_queue_item" do
    assert_difference("PostingQueueItem.count", -1) do
      delete posting_queue_item_url(@posting_queue_item)
    end

    assert_redirected_to posting_queue_items_url
  end
end
