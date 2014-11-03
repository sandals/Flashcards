module CardsHelper
	def next_card(deck, card)
		attempt = deck.cards.sample
		attempt if attempt != card else next_card
	end
end
