class DecksController < ApplicationController
	before_action :find_deck, only: [:show, :edit, :update, :destroy]

	def index
		@decks = Deck.all
	end

	def show
		@cards = @deck.cards
	end

	def new
		@deck = Deck.new
	end

	def create
		@deck = Deck.new(deck_params)
		@deck.save
		redirect_to @deck
	end

	def edit
	end

	def update
		@deck.update(deck_params)
		redirect_to decks_path
	end

	def destroy
		@deck.destroy
		redirect_to decks_path
	end

	private

	def find_deck
		@deck = Deck.find_by_id(params[:id])
	end

	def deck_params
		params.require(:deck).permit(:name)
	end
end
