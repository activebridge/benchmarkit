class CommentsController < ApplicationController
  before_action :current_user
  before_action :current_battle

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    # redirect_to battle_path(@battle)
  end

  private

  def current_battle
    @battle = Battle.find(params[:battle_id])
  end

  def comment_params
    params[:comment].merge!(head_battle_id: @battle.id, user_id: current_user.id)
    params[:comment][:comment_battle_attributes].merge!(before: @battle.before)
    params.require(:comment).permit(:text, :head_battle_id, :user_id, comment_battle_attributes: [:before, :after, :result])
  end
end
