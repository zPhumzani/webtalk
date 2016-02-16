class ArticlesController < ApplicationController
  before_action :set_article, only: [:upvote, :downvote, :show]
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
    @article = Article.pluck(:title)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  def upvote
    @article.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @article.downvote_by current_user
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end
end
