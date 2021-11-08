class FavoritesController < ApplicationController
def create
    @board = Board.find(params[:board_id])
    current_user.favorite(@board)
  end

  def destroy
    @favorite = Favorite.find_by(board_id: params[:board_id], user_id: current_user.id)
    @favorite.destroy!
  end
end
