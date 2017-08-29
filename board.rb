class Board
  attr_accessor :board, :slots, :available_moves, :solutions, :combinations
  def initialize
    @slots = {a: "A", b: "B", c: "C", d: "D", e: "E", f: "F", g: "G", h: "H", i: "I"}
    @board = "#{@slots[:a]}|#{@slots[:b]}|#{@slots[:c]}\n" +
             "#{@slots[:d]}|#{@slots[:e]}|#{@slots[:f]}\n" +
             "#{@slots[:g]}|#{@slots[:h]}|#{@slots[:i]}"
    @available_moves = ["a", "b", "c", "d", "e", "f", "g", "h", "i"]
    @solutions = ["XXX", "OOO"]
    @combinations = [
                      [ @slots[:a], @slots[:b], @slots[:c] ],
                      [ @slots[:d], @slots[:e], @slots[:f] ],
                      [ @slots[:g], @slots[:h], @slots[:i] ],
                      [ @slots[:a], @slots[:d], @slots[:g] ],
                      [ @slots[:b], @slots[:e], @slots[:h] ],
                      [ @slots[:c], @slots[:f], @slots[:i] ],
                      [ @slots[:a], @slots[:e], @slots[:i] ],
                      [ @slots[:g], @slots[:e], @slots[:c] ]
                    ]
  end

  def update_board
    @board = "#{@slots[:a]}|#{@slots[:b]}|#{@slots[:c]}\n" +
             "#{@slots[:d]}|#{@slots[:e]}|#{@slots[:f]}\n" +
             "#{@slots[:g]}|#{@slots[:h]}|#{@slots[:i]}"
  end

  def update_combinations
    @combinations = [
                      [ @slots[:a], @slots[:b], @slots[:c] ],
                      [ @slots[:d], @slots[:e], @slots[:f] ],
                      [ @slots[:g], @slots[:h], @slots[:i] ],
                      [ @slots[:a], @slots[:d], @slots[:g] ],
                      [ @slots[:b], @slots[:e], @slots[:h] ],
                      [ @slots[:c], @slots[:f], @slots[:i] ],
                      [ @slots[:a], @slots[:e], @slots[:i] ],
                      [ @slots[:g], @slots[:e], @slots[:c] ]
                    ]
  end
end
