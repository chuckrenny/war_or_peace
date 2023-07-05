class Deck
    attr_accessor :cards

    def initialize(cards)
        @cards = cards
    end
        
    def rank_of_card_at(index)
        cards[index].rank
    end

    def high_ranking_cards
        
        cards.select {|card| card.rank >= 11}
    end

    def percent_high_ranking
        ((self.high_ranking_cards.length.to_f / cards.length)*100).round(2)
    end

    # require 'pry'; binding.pry
    def remove_card
        cards.shift
    end

    def add_card(new_card)
        cards.push(new_card)
    end
end