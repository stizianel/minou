source 'https://rubygems.org'
ruby '2.1.0'
gem 'rails', '4.0.2'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'bootstrap-sass', '>= 3.0.0.0'
gem 'devise'
gem 'pg'
gem 'simple_form'
gem 'rails-i18n'
#deploy with capistrano 3.1
gem 'rake'
gem 'capistrano', '~> 3.0', require: false, group: :development
gem 'capistrano-rbenv'
gem 'prawn'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'hub', :require=>nil
  gem 'rails_layout'
  #deploy with capistrano 3.1
  gem 'capistrano-rails',   '~> 1.1', require: false
  gem 'capistrano-bundler', '~> 1.1', require: false
end
group :development, :test do
  gem 'rspec-rails'
end
group :production do
  gem 'unicorn'
  gem 'rails_12factor'
end
group :test do
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
end
