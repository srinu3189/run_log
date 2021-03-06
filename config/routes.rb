RunLog::Application.routes.draw do

  devise_for :runners

	match 'log_book' => 'log_book#index'
  match 'log_book/new_run' => 'log_book#new_run'
  match 'log_book/destroy_run' => 'log_book#destroy_run'
  match 'log_book/export' => 'log_book#export'
  root :to => 'log_book#index'
end
