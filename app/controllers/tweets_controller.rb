class TweetsController < ApplicationController
  before_action :set_tweet, only: [:destroy, :update, :downvote]

  def index
    @tweets = Tweet.not_user(current_user.id)
    @tweet = current_user.tweets.new
  end

  def show
    @tweet = Tweet.with_user_info(params[:id])
    @comment = @tweet.comments.new
    @comments = Comment.with_user_info(params[:id])
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    else
      @tweets = Tweet.not_user(current_user.id)
      render :index
    end
  end

  def update
    #@tweet.update(likes: @tweet += 1)
    @tweet.likes += 1
    @tweet.save
    redirect_to tweets_path
  end

  def downvote
    @tweet.likes -= 1
    @tweet.save
    redirect_to tweets_path
  end

  def destroy
  end

  private
    def set_tweet  
      @tweet = Tweet.find(params[:id])
    end

    def tweet_params
      params.require(:tweet).permit(:body)
    end

end
