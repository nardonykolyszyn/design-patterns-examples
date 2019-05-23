# frozen_string_literal: true

# Define parent base class
# Base -> sub-classes
# FactoryClass -> (sub-class) -> result
class BaseHTTP
  def service_url
    raise NotImplementedError
  end
end

# Generate sub-classes
class UberClient < BaseHTTP
  def service_url
    'https://api.uber.com/v1/'
  end
end

class GoogleClient < BaseHTTP
  def service_url
    'https://api.google.com/v1/'
  end
end

class SpotifyClient < BaseHTTP
  def service_url 
    'https://api.spotify.com/v1/'
  end
end

# Generate Factory class

class FactoryClient
  attr_reader :type
  def initialize(type)
    @type = case type
            when 'google' then GoogleClient.new
            when 'uber' then UberClient.new
            when 'spotify' then SpotifyClient.new
            end
  end
end

values = %w[google uber spotify].freeze

factory = FactoryClient.new(values.sample)
p factory.type.service_url
