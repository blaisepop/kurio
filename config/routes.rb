Rails.application.routes.draw do
  root to: 'videos#show', id: Video.all.sample.id
  resources :videos
end
