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
