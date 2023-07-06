class Turn
    attr_accessor :p1, :p2, :spoils, :turn_type

    def initialize(player1, player2)
        @p1 = player1
        @p2 = player2
        @spoils = []
        @turn_type = [:basic, :war, :mutually_assured_destruction]
    end

    def type
        if p1.deck.rank_of_card_at(0) != p2.deck.rank_of_card_at(0)
            :basic
        elsif p1.deck.rank_of_card_at(0) == p2.deck.rank_of_card_at(0)
            :war
        elsif p1.deck.rank_of_card_at(0) == p2.deck.rank_of_card_at(0) &&
            p1.deck.rank_of_card_at(2) == p2.deck.rank_of_card_at(2) 
            :mutually_assured_destruction
        end
    end

    def winner
        if self.type == :basic
            # if p1 rank > p2 rank, then return p1 card rank : else return p2 card rank
            p1.deck.rank_of_card_at(0) > p2.deck.rank_of_card_at(0) ? p1 : p2
        elsif self.type == :war
            p1.deck.rank_of_card_at(2) > p2.deck.rank_of_card_at(2) ? p1 : p2
        elsif self.type == :mutually_assured_destruction
            'Cold War is no longer cold. No Winner.'
        end
    end

    def pile_cards
        if self.type == :basic
            # Each player will send the top card to the spoils pile
            spoils << p1.deck.remove_card 
            spoils << p2.deck.remove_card
        elsif self.type == :war
            3.times {spoils << p1.deck.remove_card}
            3.times {spoils << p2.deck.remove_card}
        elsif self.type == :mutually_assured_destruction
            3.times {p1.deck.remove_card}
            3.times {p2.deck.remove_card}
        end
    end

    def award_spoils(player)
        player.deck.cards.concat(spoils)
        spoils.clear
    end
end
