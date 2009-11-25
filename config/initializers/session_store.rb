# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_fetoncenar_session',
  :secret      => '3a061be49adeb253506079af84a0600fd5466200401d02c3e455439d8e35b9c01ee34742745ac42742de1e3660a745c70687f09cd2733a08ada67789e90fc12f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
