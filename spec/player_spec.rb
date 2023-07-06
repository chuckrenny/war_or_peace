require 'pry'
require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'

RSpec.describe Player do
    it 'exists as a player' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)

        cards = [card1, card2, card3]
        deck = Deck.new(cards)

        player = Player.new("Clarisa", deck)

        expect(player).to be_an_instance_of(Player)
    end

    it 'can access attributes on player' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)

        cards = [card1, card2, card3]
        deck = Deck.new(cards)

        player = Player.new("Clarisa", deck)

        expect(player.name).to eq("Clarisa")
        # require 'pry';binding.pry
        expect(player.deck.cards).to eq([card1, card2, card3])
    end

    it 'can check if the player has lost' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)

        cards = [card1, card2, card3]
        deck = Deck.new(cards)

        player = Player.new("Clarisa", deck)

        expect(player.has_lost?).to be(false)
    end

    it 'can remove a card from the player deck' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)

        cards = [card1, card2, card3]
        deck = Deck.new(cards)

        player = Player.new("Clarisa", deck)

        
        expect(player.deck.remove_card).to eq(card1)
        expect(player.deck.cards).to eq([card2, card3])
    end

    it 'can determine if the player has lost' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)

        cards = [card1, card2, card3]
        deck = Deck.new(cards)

        player = Player.new("Clarisa", deck)

        player.deck.remove_card
        expect(player.has_lost?).to eq(false)

        player.deck.remove_card
        expect(player.has_lost?).to eq(false)

        player.deck.remove_card
        expect(player.has_lost?).to eq(true)

        expect(player.deck.cards).to eq([])
    end

    
end