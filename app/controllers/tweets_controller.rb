class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  # def delete
  #   @tweet = Tweet.find(params[:id])
  # end

  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      redirect_to tweets_path, notice: 'Tweet was successfully created.'
    else
      render :index
    end
  end

  def update
    @tweet = Tweet.find(params[:id])

    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: 'Tweet was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path, notice: 'Tweet was successfully destroyed.'
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
