class ReviewsController < ApplicationController
  before_action :require_user, except: [:show]
  
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:success] = "You have successfully created a new Review"
      redirect_to recipes_path(@review)
    else
      render 'new'
    end
  end
  
  def show
    binding.pry
    @review = Review.find(params[:id])
    @recipes = @review.recipes.paginate(page: params[:page], per_page: 5)
  end
  
  private
  
    def review_params
      params.require(:review).permit(:title, :opinion)
    end
  #End private
  
end