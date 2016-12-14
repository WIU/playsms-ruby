require 'cgi'

module Playsms
  module Params
    def self.encode(params)
      params.flat_map { |k, vs| Array(vs).map { |v| "#{escape(k)}=#{escape(v)}" } }.join('&')
    end

    def self.escape(component)
      CGI.escape(component.to_s)
    end
  end
end
