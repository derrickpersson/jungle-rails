class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to product_path(@review.product_id)
    else
      redirect_to :back
    end
  end

  def destroy
    @review = Review.find params[:id]
    if @review.user = current_user
      @review.destroy
      redirect_to :back, notice: 'Review deleted!'
    else
      redirect_to :back
    end
  end

private

  def review_params
    params.require(:review).permit(
      :description,
      :rating,
      :product_id
      )
  end
end
