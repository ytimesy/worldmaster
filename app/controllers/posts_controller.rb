class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :require_login, except: %i[ index show ]
  before_action :require_edit_access, only: %i[ edit update destroy ]

  # GET /posts or /posts.json
  def index
    @post_types = Post::POST_TYPES
    @tags = Tag.order(:name)
    @posts = Post.publicly_visible.includes(:user, :project, :policy_proposal, :tags).order(published_at: :desc, created_at: :desc)
    @posts = @posts.where(post_type: params[:post_type]) if params[:post_type].present?
    @posts = @posts.joins(:tags).where(tags: { slug: params[:tag] }) if params[:tag].present?
    @posts = @posts.where("posts.title ILIKE :query OR posts.body ILIKE :query", query: "%#{params[:q]}%") if params[:q].present?
  end

  # GET /posts/1 or /posts/1.json
  def show
    return if visible_post?(@post)

    redirect_to posts_path, alert: "この投稿は表示できません"
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build(post_type: "short_post", visibility: "public", status: "published")
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "投稿を作成しました。" }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "投稿を更新しました。", status: :see_other }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_path, notice: "投稿を削除しました。", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:project_id, :policy_proposal_id, :parent_post_id, :post_type, :title, :body, :visibility, :status, :published_at, :scheduled_at)
    end

    def visible_post?(post)
      return true if post.visibility == "public" && post.status == "published"
      return true if post.visibility == "unlisted" && post.status == "published"

      post.editable_by?(current_user)
    end

    def require_edit_access
      redirect_to posts_path, alert: "この操作は許可されていません" unless @post.editable_by?(current_user)
    end
end
