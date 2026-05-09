class PostingQueuesController < ApplicationController
  before_action :set_posting_queue, only: %i[ show edit update destroy ]

  # GET /posting_queues or /posting_queues.json
  def index
    @posting_queues = PostingQueue.all
  end

  # GET /posting_queues/1 or /posting_queues/1.json
  def show
  end

  # GET /posting_queues/new
  def new
    @posting_queue = PostingQueue.new
  end

  # GET /posting_queues/1/edit
  def edit
  end

  # POST /posting_queues or /posting_queues.json
  def create
    @posting_queue = PostingQueue.new(posting_queue_params)

    respond_to do |format|
      if @posting_queue.save
        format.html { redirect_to @posting_queue, notice: "Posting queue was successfully created." }
        format.json { render :show, status: :created, location: @posting_queue }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @posting_queue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posting_queues/1 or /posting_queues/1.json
  def update
    respond_to do |format|
      if @posting_queue.update(posting_queue_params)
        format.html { redirect_to @posting_queue, notice: "Posting queue was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @posting_queue }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @posting_queue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posting_queues/1 or /posting_queues/1.json
  def destroy
    @posting_queue.destroy!

    respond_to do |format|
      format.html { redirect_to posting_queues_path, notice: "Posting queue was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_posting_queue
      @posting_queue = PostingQueue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def posting_queue_params
      params.require(:posting_queue).permit(:user_id, :title, :interval_minutes, :start_at, :next_run_at, :status)
    end
end
