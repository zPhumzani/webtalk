class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
  	@comment = article.comments.build(comment_params)
  	@comment.user = current_user

  	if @comment.save
  	  redirect_to article
  	else
  	  render article
  	end
  end

  private
    def comment_params
      params.require(:comment).permit(:name, :body)
    end

    def article
      Article.find(params[:article_id])
    end

    helper_method :article

end
