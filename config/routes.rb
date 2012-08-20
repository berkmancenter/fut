Fut::Application.routes.draw do 
  root :to => 'home#index' , :as => "home"
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  get "Calculator" => "calculators#new", :as => "calculator"
  get "WhatisFairUse" => "aspects#index", :as => "wfu"
  resources :aspects, :questions, :test_answers, :answers, :attachments, :case_answers, :calculators 
  resources :Roles, :as => :roles do
    get "WhatisFairUse" => "aspects#index", :as => "wfu"
    get "Calculator" => "calculators#new", :as => "calculator"
    resources :LegalCases, :as => :legal_cases do
      resources :CaseAnswers, :as => :case_answers
    end
  end 
  match ':action' => 'static#:action'
  match ':title' => "LegalCases#show"
  match ':name' => "Roles#show"
  match ':controller(/:action(/:id))(.:format)'
end
