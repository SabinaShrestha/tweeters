class CommentsController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    comment_params = params.require(:comment).permit(:body)
    comment = tweet.comments.new(comment_params)
    comment.user_id = current_user.id
    comment.save
    redirect_to tweet_path(tweet)
  end
end
