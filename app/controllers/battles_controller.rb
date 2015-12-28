class BattlesController < ApplicationController
  def new
    @battle = Battle.new
  end

  def show
    @battle = Battle.find(params[:id])
    @comment_battle = Battle.new
    @comments = @battle.comments
    @comment = Comment.new
  end

  def create
    @battle = Battle.new(battle_params)
    @battle.save
  end

  def count
    @battle = Battle.new(battle_params)
    if @battle.valid?
      @battle.result = @battle.compare.to_json
    end
  end

  private

  def battle_params
    params[:battle].merge!(user_id: current_user&.id)
    params.require(:battle).permit!
  end
end
