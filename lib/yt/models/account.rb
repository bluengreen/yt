require 'yt/models/base'

module Yt
  module Models
    # Provides methods to access a YouTube account.
    class Account < Base
      has_one :authentication, delegate: [:access_token, :refresh_token, :expires_at]
      has_one :channel, delegate: [:videos, :playlists, :create_playlist, :delete_playlists, :update_playlists]
      has_one :user_info, delegate: [:id, :email, :has_verified_email?, :gender, :name, :given_name, :family_name, :profile_url, :avatar_url, :locale, :hd]

      def initialize(options = {})
        @access_token = options[:access_token]
        @refresh_token = options[:refresh_token]
        @expires_at = options[:expires_at]
        @authorization_code = options[:authorization_code]
        @redirect_uri = options[:redirect_uri]
        @scopes = options[:scopes]
      end

      def auth
        self
      end
    end
  end
end