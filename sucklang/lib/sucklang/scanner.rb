module Sucklang
  module Scanner
    def self.scan(source)
      tokens = []

      while !source.empty?
        case source
        when /\A[a-zA-Z_][a-zA-Z0-9_]*/
          tokens << [:ID, $&]
          source.slice!(0, $&.size)
        when /\A[\(\)]/
          tokens << [$&, $&]
          source[0] = ''
        when /\A\s+/
          source.slice!(0, $&.size)
        else
          STDERR.puts "unknown input at '#{source[0..10]}...'"
          exit 1
        end
      end

      tokens
    end
  end
end

