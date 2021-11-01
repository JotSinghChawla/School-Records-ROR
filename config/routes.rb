Rails.application.routes.draw do
  root to: 'main#index'

  # resources :students
  resources :student_classes

  resources :students do  
    collection do  
      get 'total'  
      get 'first'
    end 
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
