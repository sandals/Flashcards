class CardsController < ApplicationController
	before_filter :find_deck
	before_filter :find_card, except: [:new, :create]

	def new
		@card = @deck.cards.new
	end

	def create
		@card = @deck.cards.new(card_params)
		@card.save
		redirect_to @deck
	end

	def show
	end

	def check_answer
		guess = params[:card][:back]
		if @card.check_answer(guess)
			flash[:success] = "Correct!"
			redirect_to [@deck, @card]
		else
			flash[:notice] = "Incorrect!"
			redirect_to [@deck, @card]
		end
	end

	def edit
	end

	def update
		@card.update(card_params)
		redirect_to @deck
	end

	def destroy
		@card.destroy
		redirect_to @deck
	end

	private

	def card_params
		params.require(:card).permit(:front, :back)
	end

	def find_deck
		@deck = Deck.find_by_id(params[:deck_id])
	end

	def find_card
		@card = Card.find_by_id(params[:id])
	end
end
