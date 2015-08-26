# must in the top-level namespace
class Array
  def arr_to_hsh
    hsh = {}
    self.each {|e| hsh.merge!(e)}
    hsh
  end
end

module QingCloudServer
  module Client

    class ServiceFoudation
      attr_accessor :response
      def initialize(connector)
        @connector = connector
      end

      def fetch_response(action, params)
        params.each do |k, v|
          params.delete(k) unless (v.is_a?(Numeric)) || (v && v.length > 0)
        end

        self.response = @connector.fetch_server_condition(action, params)
      end

      # def convert_arr_to_hash(arr)
      #   hash = {}
      #   arr.each {|h| hash.merge!(h)}
      #   hash
      # end

      def make_action_and_params
        "
        fetch_response(
            __method__.to_s.split('_').map {|e| e.capitalize!}.join,
            method(__method__).parameters.map { |_, p| {p.to_sym => eval(p.to_s)} }.arr_to_hsh
        )
        "
      end
    end
  end
end
