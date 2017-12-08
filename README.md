### Original Readme ###
# README

E-commerce site. Uses `bcrypt` and `materialize`. There's a seed file. Set up your own admin. If you have questions, I'll be in Bali with no email. Ask someone else.

To set up:

* `rake db:setup`

* Sorry, didn't get around to tests. It mostly works. There might be a few bugs.

### End of Original Readme ###

# Refactor Rails App with AJAX

## By Noah Gottlieb

### Refactor Steps

* First I checked the gemfile to see if there were any missing gems I would need for thorough testing and launching the application
  -- I added: shoulda-matchers, rspec-rails, capybara, factory-bot, simplecov and faker

* Next I checked the db for any inconsistencies
  -- removed added migrations and added them to there respected tables, changed AR Migration version from [5.0]->[5.1]. Also added admin to users table, created a account table for user_id, fixed total price in orders table to include total_price as a decimal. Added popper to application.js. Added Model for Accounts and its relations.

* Removed gemfile.lock and rebundled to fix migration error for add accounts table.

* Checked All models before migration to check relations.
