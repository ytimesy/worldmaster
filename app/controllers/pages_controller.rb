class PagesController < ApplicationController
  def home
    @featured_projects = Project.where(visibility: "public").order(updated_at: :desc).limit(5)
    @featured_policies = PolicyProposal.where(visibility: "public").order(updated_at: :desc).limit(5)
    @recent_posts = Post.where(visibility: "public", status: "published").order(published_at: :desc).limit(10)
  end
end
