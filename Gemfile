source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.2'

gem 'rails', '~> 5.2.2'
gem 'puma', '~> 5.5'
gem 'active_model_serializers', '~> 0.10.0'
# gem 'jbuilder', '~> 2.5'
# gem 'redis', '~> 4.0'
gem 'bcrypt', '~> 3.1.7'
gem 'jwt'

# gem 'mini_magick', '~> 4.8'

# gem 'capistrano-rails', group: :development

gem 'bootsnap', '>= 1.1.0', require: false

gem 'rack-cors'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'sqlite3'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg'
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
