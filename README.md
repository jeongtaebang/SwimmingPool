# README

This is the web application for Swimming Pool study cafe featuring a lecture registration system and user quizlet services.

* Ruby version: 2.3.0

* Deployment instructions
	- for assets (broken image links): $ RAILS_ENV=production bundle exec rake assets:precompile
									   $ git add public/assets
									   $ git commit -m "vendor compiled assets"

* Development env db: sqlite3, deployed in Heroku Postgres

* Facebook Login API, Naver Login API, GoogleMapsJavascript API, and Sendgrid ENV[variables] need to be reset by the administrater
	- FB and Naver Login: devise.rb 				line 252 - 254
	- Google Maps: views/layouts/_footer.html.erb 	line 31
	- Sendgrid: production.rb 						line 74 - 75

* Seed.rb
	- admin user
	- 4 Lectures
	- To seed, $ heroku run rails db:seed
