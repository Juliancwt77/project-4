Rails.application.routes.draw do

    devise_for :users, :controllers => { :registrations => 'users/registrations'}

    root 'home#index'

    get 'about', to: 'home#about'

    get 'contact', to: 'home#contact'

    get 'job_offers_candidate', to: 'recruits#job_offers_candidate'

    get 'jobs_offered_company', to: 'recruits#jobs_offered_company'

    get 'candidate_accept_offer', to: 'recruits#candidate_accept_offer'

    resources :recruits

    resources :candidates

    resources :postings

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
