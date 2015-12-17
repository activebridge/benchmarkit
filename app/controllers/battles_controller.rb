class BattlesController < ApplicationController
  def new
    @battle = Battle.new
  end

  def create
    @battle = Battle.new(battle_params)
    if @battle.save
      render battle_url(@battle)
    else
      render 'Something went wrong. Try find again.'
    end
  end

  def count
    @battle = Battle.new(battle_params)
    if @battle.valid?
      @battle.result = @battle.compare.to_json
    end
  end

  private

  def battle_params
    params.require(:battle).permit!
  end
end
