class BoardsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @boards = Board.all
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to root_path, notice: '保存できたよ🌟'
    else
      flash.now[:error] = '保存失敗😭'
      render :new
    end
  end

  def edit
    @board = current_user.boards.find(params[:id])
  end

  def update
    @board = current_user.boards.find(params[:id])
    if @board.update(board_params)
      redirect_to root_path, notice: '保存できたよ🌟'
    else
      flash.now[:error] = '保存失敗😭'
      render :edit
    end
  end

  def destroy
    board = current_user.boards.find(params[:id])
    board.destroy!
    redirect_to root_path
  end

  private
  def board_params
    params.require(:board).permit(:title, :content)
  end
end