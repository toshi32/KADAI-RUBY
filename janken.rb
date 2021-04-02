class Player
  def hand
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
    input_hand = gets.chomp
    input_hand = input_hand.to_i
      while true
         if input_hand == 0 || input_hand == 1 || input_hand == 2
          return input_hand
         else
          puts "もう一度数字を入力してください。"
          puts "0:グー, 1:チョキ, 2:パー"
          input_hand = gets.chomp
          input_hand = input_hand.to_i
         end
      end
  end
end

class Enemy
  def hand
    enemy_hand = rand(3)
  end
end

class Janken
  def pon(player_hand, enemy_hand)
   janken = ["グー", "チョキ", "パー"]
   while true
    if (player_hand - enemy_hand + 3)%3 === 0
     puts "あなたの手:#{janken[player_hand]},相手の手:#{janken[enemy_hand]}で【あいこ】です。"
     return true
    elsif (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
     puts "あなたの手:#{janken[player_hand]},相手の手:#{janken[enemy_hand]}であなたの【勝ち】です。"
     return false
    else
     puts "あなたの手:#{janken[player_hand]},相手の手:#{janken[enemy_hand]}であなたの【負け】です。"
     return false
    end
   end
  end
end

   player = Player.new
   enemy = Enemy.new
   janken = Janken.new

next_game = true
while next_game
  next_game = janken.pon(player.hand, enemy.hand)
end
