require './game'
require_relative 'spec_helper'

describe Game do
  subject(:game) { Game.new("Guillermo", "Joe")}

  describe "players turn" do
    it "should switch whose turn it is" do
      expect(game.next_player).to eql(game.player2)
    end
  end

  describe "announce outcome" do
    it "player 1 should win" do
      expect(game.announce_outcome("XXX")).to eql(puts "#{game.player1.name} is the winner!")
    end
    it "player 2 should win" do
      expect(game.announce_outcome("OOO")).to eql(puts "#{game.player2.name} is the winner!")
    end
    it "should be a tie" do
      expect(game.announce_outcome("")).to eql(puts "It's a tie!")
    end
  end

  describe "game winning outcomes" do
    it "board reads X X X across first row" do
      game.board.slots[:a] = "X"
      game.board.slots[:b] = "X"
      game.board.slots[:c] = "X"
      game.is_game_over
      expect(game.gameOver).to eql(true)
    end
  end

end
