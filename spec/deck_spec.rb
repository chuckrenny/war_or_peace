require 'pry'
require 'rspec'
require './lib/deck'
require './lib/card'

# EDIT

RSpec.describe Deck do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    
    expect(deck).to be_an_instance_of(Deck)
  end

  it "can find the rank of cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(1)).to eq(3)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end

  it "can return high ranking cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.high_ranking_cards).to eq([card1,  card3])
  end

  it 'can return percent of cards that are high ranking' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    expect(deck.percent_high_ranking).to eq(66.67)
  end

  it 'can remove the top card from the deck' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    
    deck.remove_card

    expect(cards).to eq([card2, card3])
    expect(deck.high_ranking_cards).to eq([card3])
    expect(deck.percent_high_ranking).to eq(50.0)
  end

  it 'can add cards to the end of the deck' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    deck.add_card(card4)

    expect(cards).to eq([card1, card2, card3, card4])
    expect(deck.high_ranking_cards).to eq([card1, card3])
    expect(deck.percent_high_ranking).to eq(50.0)
  end
end
