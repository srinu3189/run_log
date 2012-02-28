RunLog::Application.routes.draw do

	match 'log_book' => 'log_book#index'
  match 'log_book/new_run' => 'log_book#new_run'
  match 'log_book/destroy_run' => 'log_book#destroy_run'

end
