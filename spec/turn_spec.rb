require 'pry'
require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
    let(:card1) { Card.new(:heart, 'Jack', 11) }
    let(:card2) { Card.new(:heart, '10', 10) }
    let(:card3) { Card.new(:heart, '9', 9) }
    let(:card4) { Card.new(:diamond, 'Jack', 11) }
    let(:card5) { Card.new(:heart, '8', 8)  }
    let(:card6) { Card.new(:diamond, 'Queen', 12)}
    let(:card7) { Card.new(:heart, '3', 3)}
    let(:card8) { Card.new(:diamond, '2', 2)}

    let(:cards1) { [card1, card2, card5, card8]}
    let(:cards2) { [card3, card4, card6, card7]}

    let(:deck1)  { Deck.new(cards1) }
    let(:deck2)  { Deck.new(cards2) }

    let(:player1) { Player.new("Megan", deck1)}
    let(:player2) { Player.new("Aurora", deck2)}

    let(:turn)    { Turn.new(player1, player2)}

    it 'exists as a class' do
      expect(turn).to be_an_instance_of(Turn)
    end

    it 'can access the attributes in Turn Class' do
      expect(turn.p1).to eq(player1)
      expect(turn.p2).to eq(player2)
      expect(turn.spoils).to eq([])
    end

    it 'can tell what type of turn it will be' do
      expect(turn.type).to eq(:basic)
    end

    it 'can determine the winner of the turn' do
      turn.type
      winner = turn.winner

      expect(winner).to eq(turn.p1)
    end

    it 'can remove cards and send them to the spoils' do
      turn.type
      winner = turn.winner

      turn.pile_cards
      expect(turn.spoils).to eq([card1, card3])
    end

    it 'can award spoils to the winner of the turn' do
      turn.type
      expect(turn.type).to eq(:basic)

      winner = turn.winner
      expect(winner).to eq(turn.p1)

      turn.pile_cards

      turn.award_spoils(winner)
      expect(turn.spoils).to eq([])
      expect(winner.deck.cards).to eq([card2, card5, card8, card1, card3])

      expect(turn.p2.deck.cards).to eq([card4, card6, card7])
    end

  describe "Second War" do
    let(:card1) { Card.new(:heart, 'Jack', 11) }
    let(:card2) { Card.new(:heart, '10', 10) }
    let(:card3) { Card.new(:heart, '9', 9) }
    let(:card4) { Card.new(:diamond, 'Jack', 11) }
    let(:card5) { Card.new(:heart, '8', 8)  }
    let(:card6) { Card.new(:diamond, 'Queen', 12)}
    let(:card7) { Card.new(:heart, '3', 3)}
    let(:card8) { Card.new(:diamond, '2', 2)}

    let(:cards1) { [card1, card2, card5, card8]}
    let(:cards2) { [card4, card3, card6, card7]}

    let(:deck1)  { Deck.new(cards1) }
    let(:deck2)  { Deck.new(cards2) }

    let(:player1) { Player.new("Megan", deck1)}
    let(:player2) { Player.new("Aurora", deck2)}

    let(:turn)    { Turn.new(player1, player2)}

    it 'determines the type of the second war' do
      expect(turn.type).to eq(:war)
    end

    it 'determines the winner of the second war' do
      expect(turn.winner).to eq(turn.p2)
    end

    it 'can utilize pile_cards and award_spoils to winner of the second war' do
      winner = turn.winner
      turn.pile_cards
      expect(turn.spoils).to eq([card1, card2, card5, card4, card3, card6])

      turn.award_spoils(winner)
      expect(turn.p2.deck.cards).to eq([card7, card1, card2, card5, card4, card3, card6])

      expect(player1.deck.cards).to eq([card8])
    end
  end

  describe "Third War" do
    let(:card1) { Card.new(:heart, 'Jack', 11) }
    let(:card2) { Card.new(:heart, '10', 10) }
    let(:card3) { Card.new(:heart, '9', 9) }
    let(:card4) { Card.new(:diamond, 'Jack', 11) }
    let(:card5) { Card.new(:heart, '8', 8)  }
    let(:card6) { Card.new(:diamond, '8', 8)}
    let(:card7) { Card.new(:heart, '3', 3)}
    let(:card8) { Card.new(:diamond, '2', 2)}

    let(:cards1) { [card1, card2, card5, card8]}
    let(:cards2) { [card4, card3, card6, card7]}

    let(:deck1)  { Deck.new(cards1) }
    let(:deck2)  { Deck.new(cards2) }

    let(:player1) { Player.new("Megan", deck1)}
    let(:player2) { Player.new("Aurora", deck2)}

    let(:turn)    { Turn.new(player1, player2)}

    it "determines the type of the third war" do
      expect(turn.type).to eq(:mutually_assured_destruction)
    end

    it "determines the winner of the third war" do
      expect(turn.winner).to eq('No Winner.')
    end

    it 'can utilize pile_cards and award_spoils to winner of the second war' do
      winner = turn.winner
      turn.pile_cards
      expect(turn.spoils).to eq([])

      expect(turn.p2.deck.cards).to eq([card7])

      expect(player1.deck.cards).to eq([card8])
    end
  end
end