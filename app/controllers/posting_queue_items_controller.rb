class PostingQueueItemsController < ApplicationController
  before_action :set_posting_queue_item, only: %i[ show edit update destroy ]

  # GET /posting_queue_items or /posting_queue_items.json
  def index
    @posting_queue_items = PostingQueueItem.all
  end

  # GET /posting_queue_items/1 or /posting_queue_items/1.json
  def show
  end

  # GET /posting_queue_items/new
  def new
    @posting_queue_item = PostingQueueItem.new
  end

  # GET /posting_queue_items/1/edit
  def edit
  end

  # POST /posting_queue_items or /posting_queue_items.json
  def create
    @posting_queue_item = PostingQueueItem.new(posting_queue_item_params)

    respond_to do |format|
      if @posting_queue_item.save
        format.html { redirect_to @posting_queue_item, notice: "Posting queue item was successfully created." }
        format.json { render :show, status: :created, location: @posting_queue_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @posting_queue_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posting_queue_items/1 or /posting_queue_items/1.json
  def update
    respond_to do |format|
      if @posting_queue_item.update(posting_queue_item_params)
        format.html { redirect_to @posting_queue_item, notice: "Posting queue item was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @posting_queue_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @posting_queue_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posting_queue_items/1 or /posting_queue_items/1.json
  def destroy
    @posting_queue_item.destroy!

    respond_to do |format|
      format.html { redirect_to posting_queue_items_path, notice: "Posting queue item was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_posting_queue_item
      @posting_queue_item = PostingQueueItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def posting_queue_item_params
      params.require(:posting_queue_item).permit(:posting_queue_id, :post_id, :position, :status, :scheduled_at, :published_at)
    end
end
