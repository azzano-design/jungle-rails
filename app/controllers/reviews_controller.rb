class ReviewsController < ApplicationController
  before_filter :authorize, only: [:create, :destroy]
  def index
    @review = Review.new
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review= Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user_id = current_user.id
    @review.user = current_user
    if @review.save
      flash[:success] = "Review saved"
      redirect_to product_path(params[:product_id])
    else
      puts "here-------"
      render 'new'
    end
  end

  def destroy
    @del = Review.find(params[:id]).destroy
    flash[:success] = "good"
    redirect_to :back
  end

  private
    def review_params
      params.require(:review).permit(:product_id,
                                     :description,
                                     :rating);
    end
end
