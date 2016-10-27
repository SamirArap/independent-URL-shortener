Rails.application.routes.draw do

  root to: 'urls#index'

  resource :urls, only: [:index, :create]

  get '/:id', to: 'urls#redirect'

end
