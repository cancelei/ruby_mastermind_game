require_relative '../game'

RSpec.describe Mastermind do
  describe "#initialize" do
    it "initializes the game with 12 turns" do
      game = Mastermind.new
      expect(game.instance_variable_get(:@turns)).to eq(12)
    end
  end

  describe "#check_guess" do
    let(:game) { Mastermind.new }

    it "returns correct exact matches" do
      game.instance_variable_set(:@secret_code, [1, 2, 3, 4])
      expect(game.send(:check_guess, [1, 5, 6, 7])).to include(exact: 1)
    end

    it "returns correct partial matches" do
      game.instance_variable_set(:@secret_code, [1, 2, 3, 4])
      expect(game.send(:check_guess, [4, 3, 2, 1])).to include(partial: 4)
    end
  end
end
