module BattleHelper
  def display_result(battle)
    JSON.parse(battle.result)
  end
end
