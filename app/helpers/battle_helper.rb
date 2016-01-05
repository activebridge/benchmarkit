module BattleHelper
  def display_result(battle)
    result = JSON.parse(battle.result)
    battle.comment ? result[1..-1] : result
  end
end
