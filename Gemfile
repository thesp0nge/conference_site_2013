source 'https://rubygems.org'
ruby '2.0.0'

gem 'padrino', '0.11.1'

# Project requirements
gem 'compass', '~> 0.12.2'
gem 'rake', '~> 10.0.4'

# Component requirements
gem 'bcrypt-ruby', '~> 3.0.1', require: 'bcrypt'
gem 'data_mapper', '~> 1.2.0'
gem 'haml', '> 4.0.0'

group :development, :test do
  gem 'dm-sqlite-adapter', '~> 1.2.0'
end

group :production do
  gem 'dm-postgres-adapter', '~> 1.2.0'
end