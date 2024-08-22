class GamesController < ApplicationController
  def index
    @games = Game.all
    render json: @games
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  def show
    @game = Game.find(params[:id])
    render json: @game
  end

  def destroy
    @game = Game.find(params[:id])
    Player.where('favourite_game_id = ?', @game.id).update_all(favourite_game_id: nil)
    @game.destroy
    render json: {}
  end
  
  def destroy_all
    Player.update_all(favourite_game_id: nil)
    Game.destroy_all
    render json: []
  end

  def top
    quantity = params[:quantity].to_i
    all_games = Game.all
    sorted_games = all_games.sort_by { |game| [-game.calification, -game.id] }
    top_games = sorted_games.first(quantity)
    render json: top_games
  end

  def delete_worst_game
    all_games = Game.all
    sorted_games = all_games.sort_by { |game| [-game.calification, -game.id] }
    last_game = sorted_games.last
    render json: last_game
    last_game.destroy
  end

  def update_calification
    @game = Game.find(params[:game_id])
    reviews = Review.where('game_id = ?', @game.id)
    califications = []  
    
    for review in reviews do
      califications << review.calification
    end
    
    mean_calification = califications.sum / califications.size.to_f
    @game.update(calification: mean_calification)
    render json: @game
  end
  

  def game_params
    params.require(:game).permit(:name, :calification, :description)
  end

end
