require "queryparams/version"                                                                                                                                                    
require "cgi"

module QueryParams

 def self.encode(value, key = nil)
   case value
   when Hash  then value.map { |k,v| encode(v, append_key(key,k)) }.join('&')
   when Array then value.map.with_index { |v, index| encode(v, "#{key}[#{index}]") }.join('&')
   when nil   then ''
   else
     "#{key}=#{CGI.escape(value.to_s)}"
   end
 end

 private

 def self.append_key(root_key, key)
   root_key.nil? ? key : "#{root_key}[#{key.to_s}]"
 end
end
