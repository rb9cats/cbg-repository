# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_CBG_session',
  :secret      => 'e04c5f3542fde1380c4e4945416ecf892c80a211bf09138c63eaf9938d7a9c5e66283bd63665904429790ecbbd2c9249c5adb3c80db368546f970a1ff52f988f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
