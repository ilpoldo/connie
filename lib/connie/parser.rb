module Connie
  module Parser
    
    #TODO: implement negative lookahead to allow escaping \: and escaping the escaping symbol itself \\
    @syntax = {# :method or :dictionary.method
               %r{((?:[\\]+)?\:\w\w+(?:.\w+)?)} => lambda do |dictionary_and_method|
                arguments = dictionary_and_method[1..-1].split('.').map &:to_sym
                case arguments.size
                when 2 then Connie[arguments[0]].send arguments[1]
                when 1 then scope.send arguments[0]
                end
               end,
               # :d - one digit
               %r{((?:[\\]+)?\:[wWd])(?:[^\w\{])} => lambda do |letter_or_digit|
                Connie.formats letter_or_digit[1].to_sym
               end,
               # :w{2,4} - two to four letters
               %r{((?:[\\]+)?\:[wWd](?:\{\d+(?:,\d+)?\}))} => lambda do |character_and_frequency|
                character, f_min, f_max = character_and_frequency[1..-1].match(%r{(\w)(?:\{(\d+)(?:,(\d+))?\})})[1..-1]
                Connie.formats character.to_sym, f_min.to_i, f_max.to_i
               end
               
              }
    
    def self.process string_to_parse, dictionary = Connie[:names]
      tokenized = string_to_parse.split Regexp.union(@syntax.keys)
            
      apply_syntax(tokenized, dictionary).join
    end
    
    # calls trasform on the tokens marked for interpolation and deals with escaping
    def self.apply_syntax tokens, scope
      tokens.map do |t|
        if t[0] && t[0].chr == ':'
          transform t, scope
        elsif t[0] && t[0].chr == '\\' # some level of escaping is present
          raise 'I don\' speak escapeese yet!'
        else
          t
        end
      end
    end
    
    # Interpolates a syntax token
    def self.transform string, scope
      result = nil
      @syntax.each_pair { |k,func| result = func.call(string) if string.match(k) }
      return result
    end
    
  end
end