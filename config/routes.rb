Rails.application.routes.draw do
  root 'search#index'

  post 'search/near_station' => 'search#near_station'
  post 'search/approach' => 'search#approach', as: :approach
end
