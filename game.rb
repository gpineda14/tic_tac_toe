class Game
  require './player.rb'
  require './board.rb'
  attr_accessor :board, :player1, :player2
  def initialize(player1="player1", player2="player2")
    @board = Board.new
    @player1 = Player.new(player1, "X")
    @player2 = Player.new(player2, "O")
    @gameOver = false
    @outcome = ""
  end

  def begin_game
    moves = 1
    puts "Let's play Tic-Tac-Toe!"
    puts @board.board
    puts "Each letter indicates a move"
    until @gameOver || moves > 9
      prompt_user(@player1)
      puts @board.board
      moves += 1
      prompt_user(@player2)
      puts @board.board
      is_game_over
      moves += 1
    end
    announce_outcome(@outcome)
  end

  def prompt_user(player)
    if @board.available_moves.empty?
      puts "Out of moves!"
    else
      puts "#{player.name}, enter a move (A-I): "
      move = gets.chomp.downcase
      while !move.match(/^[a-i]$/)
        puts "Invalid move, try again"
        move = gets.chomp.downcase
      end
      if @board.available_moves.include?(move)
        @board.slots[move.to_sym] = player.char
        @board.update_board
        @board.available_moves.delete(move)
      end
    end
  end

  def is_game_over
    @board.update_combinations
    @board.combinations.each do |combination|
      curr = combination.inject { |combo, slot| combo + slot }
      if @board.solutions.any? { |solution| solution == curr}
        @outcome = curr
        @gameOver = true
      end
    end
  end

  def announce_outcome(outcome)
    if @outcome == ""
      puts "It's a tie!"
    else
      puts outcome[0] == @player1.char ? "#{@player1.name} is the winner!": "#{@player2.name} is the winner!"
    end
  end

end
