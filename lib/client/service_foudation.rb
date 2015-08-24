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
      def initialize(connector)
        @connector = connector
      end

      def fetch_response(action, params)
        @connector.fetch_server_condation(action, params)
      end

      def convert_arr_to_hash(arr)
        hash = {}
        arr.each {|h| hash.merge!(h)}
        hash
      end

      def make_action_and_params
        "
        fetch_response(
            __method__.to_s.split('_').map {|e| e.capitalize!}.join,
            eval('convert_arr_to_hash(method(__method__).parameters.map { |_, p| {p.to_sym => eval(p.to_s)} })')
        )
        "
      end
    end
  end
end
