# -*- coding: utf-8 -*-
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

      def fetch_server_condition(action, params)
#        request_url = APIAddress + "&action=#{action}"

        params.update(
                      :action => action,
                      :time_stamp => Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ"),
                      :access_key_id => self.public_key,
                      :version => 1,
                      :signature_method => "HmacSHA256",
                      :signature_version => 1
                      )

        request_body = params.sort.map do |k, v| # 这里的k是symbol，要先转化成为string，然后再使用
          if k.to_s.include?("_N")
            key_part = k.to_s.split("_")[0]
            v.map {|e| "#{CGI.escape(key_part)}.#{v.index(e) + 1}=#{CGI.escape(e)}"}
          else
            "#{CGI.escape(k.to_s)}=#{CGI.escape(v.to_s)}"
          end
        end.join("&")

        puts "request_body #{request_body.inspect}"
        request_url = "GET\n/iaas/\n#{request_body}"

        sha_256_digest = OpenSSL::Digest.new("sha256")
        signature = OpenSSL::HMAC.digest(sha_256_digest, self.secret_key, request_url)
        signature = Base64.encode64(signature).strip
        puts "signature is #{signature}"

        uri = URI("#{APIAddress}#{request_body}&signature=#{CGI.escape(signature)}")
        # Net::HTTP.start(uri.host, uri.port, :user_ssl => uri.scheme == "https") do |http|
        #   req = Net::HTTP::Get.new(uri)
        #   res = http.request(req)
        # end
        response_body = Net::HTTP.get_response(uri).body
      end

    end
  end
end
