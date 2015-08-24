require 'cgi'
require 'openssl'
require 'base64'
require 'net/http'
module QingCloudServer
  module Client
    class Connector

      APIAddress = "https://api.qingcloud.com/iaas/?"

      attr_accessor :public_key
      attr_accessor :secret_key
      def initialize(public_key, secret_key)
        @public_key = public_key
        @secret_key = secret_key
      end

      def self.init(public_key, secret_key)
        Connector.new(public_key, secret_key)
      end

      def fetch_server_condation(action, params)
        request_url = APIAddress + "&action=#{action}"

        request_body = params.sort.map do |k, v|
          if k.to_s.include?("_N")
            key_part = k.to_s.split("_")[0]
            v.map {|e| "#{CGI.escape(key_part[0])}.#{index(e) + 1}=#{CGI.escape(e)}"}
          else
            "#{CGI.escape(k)}=#{CGI.escape(v)}"
          end.join("&")
        end

        request_url = "GET\n/iaas/\n#{request_body}"
        sha_256_digest = OpenSSL::Digest.new("sha256")
        signature = OpenSSL::HMAC.digest(sha_256_digest, self.secret_key, request_url)

        uri = URI(APIAddress + "action#{action}&#{request_body}#{signature}")
        Net::HTTP.start(uri.host, uri.port, :user_ssl => uri.scheme == "https") do |http|
          req = Net::HTTP::Get.new(uri)
          res = http.request(req)
        end
      end

    end
  end
end
