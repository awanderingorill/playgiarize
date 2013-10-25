class SessionController < ApplicationController

  def new
  end

  def create
    username = params[:username]
    password = params[:password]
    user = User.where(username: username).first
    if user && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to user
      if session[:piece_id]
        piece = Piece.find(session[:piece_id])
        piece.user_id = session[:user_id]
        piece.save
        session[:piece_id] = nil
      end
    else
      raise
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to('/')
  end

  def prompt
  end

  def about
  end

end