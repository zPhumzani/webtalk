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

  def image 
    @image = Article.friendly.find(params[:id])
    send_data @image.file_contents, filename: @image.filename, type: @image.content_type, :diposition => "inline"
  end

  def search
    @articles = Article.where(["lower(title) like ?", "%" + params[:search].downcase + "%"])
    if params['search'].to_s.size < 1
      redirect_to root_url, alert: "You just search for nothing?"
    else
      render :index
    end
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
      @article = Article.friendly.find(params[:id])
    end
end
