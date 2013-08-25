Whatshallwedo::Application.routes.draw do
  resources :activities do
    collection do
      get 'suggestions'
    end
  end
  put 'activities/suggestions/criteria' => 'criteria#update'
  delete 'activities/suggestions/criteria' => 'criteria#destroy'
  root 'activities#suggestions'
end
