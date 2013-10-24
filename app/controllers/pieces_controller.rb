class PiecesController < ApplicationController
  # def index
  #   if params[:user]
  # end

  def new
    @piece = Piece.new
    @user = session[:user_id]
  end

  def index
    @pieces = Piece.all
  end

  def create
    piece = Piece.new(params[:piece])
    piece.plagiarize
    if session[:user_id]
      piece.user_id = session[:user_id]
    end
    piece.save
    session[:piece_id] = piece.id
    redirect_to piece
  end

  def show
    id = params[:id]
    @piece = Piece.find(id)
  end

  def edit
    @piece = Piece.find params[:id]
  end

  def update
    piece = Piece.find params[:id]
    piece.update_attributes(params[:piece])
    redirect_to piece
  end

  def destroy
    piece = Piece.find params[:id]
    user = piece.user
    piece.destroy
    session[:piece_id] = nil
    redirect_to user
  end

end