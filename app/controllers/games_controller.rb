class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end
  
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    if @game.save!
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render :new
    end
  end
  
  def destroy
    @game = Game.find(params[:id])
    @game.delete
    redirect_to game_path(@game)
  end

  private

  def game_params
    params.require(:game).permit(:name, :description, :category, :price)
  end
end