Rails.application.routes.draw do
  get 'cards/index'

	resources :decks do
		resources :cards, except: [:index]
		post "/cards/:id", to: "cards#check_answer"
	end
end
