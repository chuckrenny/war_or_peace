class Player
    attr_accessor :name, :deck, :lost

    def initialize(name, deck)
        @name = name
        @deck = deck
        @lost = false
    end

    def has_lost?
        if deck.cards.length == 0
            @lost = true
        else
            @lost = false
        end
    end
end