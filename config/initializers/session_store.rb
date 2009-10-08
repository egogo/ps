# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_photo_session',
  :secret      => 'c4f173c516ca6b7bf851342db440fb9fd8e9027ab49fcff694de9155ce078d22f12028ec16ac71265cfaf81c0616b80899efaf81161eaa7662cb64bb66fddcc8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
