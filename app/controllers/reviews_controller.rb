class ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:id])
    render json: @review
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def update 
    @review = Review.find(params[:review_id])
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: unprocessable_entity
    end
  end

  def show_with_game_id
    game = Game.find_by("name = ?", params[:game])
    if game
      @reviews = Review.where("game_id = ?", game.id)
      render json: @reviews
    else
      render json: { error: "Game not found" }, status: :not_found
    end
  end

  def player_by_review_id
    @review = Review.find(params[:review_id])
    
    if @review
      player = Player.find(@review.player_id)

      if player
        render json: player
      else
        render json: player.errors, status: unprocessable_entity
      end
    else
      render json: @review.errors, status: unprocessable_entity
    end
  end

  def show_all
    render json: Review.all
  end

  def review_params
    params.require(:review).permit(:title, :description, :calification, :player_id, :game_id)
  end
end
