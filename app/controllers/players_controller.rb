class PlayersController < ApplicationController
  def index
    @players = Player.all
    render json: @players
  end

  def show
    @player = Player.find(params[:player_id])
    render json: @player
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      render json: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  def create_player_with_game_id
    game_id = params[:game_id]
    @player = Player.new(player_params)
    @player.favourite_game_id = game_id
    if @player.save
      render json: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  def destroy_all
    Player.destroy_all
    render json: []
  end

  def favourite_game
    @player = Player.find(params[:player_id])
    game_id = @player.favourite_game_id
    game = Game.find(game_id)
    if game
      render json: game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  def player_params
    params.require(:player).permit(:name, :preference, :phone)
  end
  
end
