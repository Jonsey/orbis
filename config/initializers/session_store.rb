# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_StarterHerUp_session',
  :secret      => 'c517afbb00c7dce17ea194ab894f5d7951c8682d2442e699e8baa44d63d233268aa8689b166bbbdcc3b9ca09ec48e81c8f3e0cd99be5ddbfc793684aa09abf9b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
