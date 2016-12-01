Rails.application.routes.draw do


devise_for :users, :controllers => { :registrations => 'users/registrations'}

    root 'home#index'

    get 'about', to: 'home#about'

    get 'contact', to: 'home#contact'

    resources :recruits

    resources :candidates

    resources :postings

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
