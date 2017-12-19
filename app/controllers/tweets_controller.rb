class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.all
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
	twt = Tweet.find_by id: params[:id], rid: params[:rid]
render.json: {'twt' => twt.content}
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  # POST /tweets.json
	def create
    	rsa = Rsa.find_by id: params[:id]

	encrypted = (params[:tweet].chars.map {|c| c.ord ** @e % @n}).join(",")
	twt = Tweet.new({rid: rsa.id, content: encrypted})
		if(twt.save)
			render.json: {'id' => twt.id}
		end
	end
	
def decrypt
		rsa = Rsa.find_by id: params[:id]

		decrypted = (params[:tweet].split(",").map {|c| (c.to_i ** @d % @n).chr}).join("")
		render.json: {'content' => decrypted}
	end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
       params.require(:tweets).permit(:content, :id)
    end
end
