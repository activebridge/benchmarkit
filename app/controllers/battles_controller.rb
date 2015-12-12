class BattlesController < ApplicationController
  def new
    @battle = Battle.new
  end

  def create
    battle = Battle.new(battle_params)
    @result = battle.compare if battle.valid?
  end

  private

  def battle_params
    params.require(:battle).permit!
  end
end
