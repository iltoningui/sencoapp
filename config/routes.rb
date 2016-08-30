Rails.application.routes.draw do
  resources :piteus
  resources :localizacoes
  resources :produtos
  resources :horarios
  resources :fotografias
  resources :alugueres
  resources :servicos
  resources :pedidos
  resources :carrinhos
  resources :usuarios
  resources :lojas
  resources :gerais
  resources :welcomes
  root to: "welcomes#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
