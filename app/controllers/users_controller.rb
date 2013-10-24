class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    user.save
    if session[:piece_id]
      piece = Piece.find(session[:piece_id])
      piece.user_id = user.id
      piece.save
      session[:piece_id] = nil
    end
    session[:user_id] = user.id
    redirect_to user
  end

  def show
    user = User.find(params[:id])
    @pieces = user.pieces
  end

  def update
  end

  def destroy
  end

end