class ScheduledPostsController < ApplicationController
  before_action :set_scheduled_post, only: %i[ show edit update destroy ]

  # GET /scheduled_posts or /scheduled_posts.json
  def index
    @scheduled_posts = ScheduledPost.all
  end

  # GET /scheduled_posts/1 or /scheduled_posts/1.json
  def show
  end

  # GET /scheduled_posts/new
  def new
    @scheduled_post = ScheduledPost.new
  end

  # GET /scheduled_posts/1/edit
  def edit
  end

  # POST /scheduled_posts or /scheduled_posts.json
  def create
    @scheduled_post = ScheduledPost.new(scheduled_post_params)

    respond_to do |format|
      if @scheduled_post.save
        format.html { redirect_to @scheduled_post, notice: "Scheduled post was successfully created." }
        format.json { render :show, status: :created, location: @scheduled_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @scheduled_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scheduled_posts/1 or /scheduled_posts/1.json
  def update
    respond_to do |format|
      if @scheduled_post.update(scheduled_post_params)
        format.html { redirect_to @scheduled_post, notice: "Scheduled post was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @scheduled_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @scheduled_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scheduled_posts/1 or /scheduled_posts/1.json
  def destroy
    @scheduled_post.destroy!

    respond_to do |format|
      format.html { redirect_to scheduled_posts_path, notice: "Scheduled post was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduled_post
      @scheduled_post = ScheduledPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scheduled_post_params
      params.require(:scheduled_post).permit(:user_id, :post_id, :posting_queue_id, :scheduled_at, :status, :error_message)
    end
end
