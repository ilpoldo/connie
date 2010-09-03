module Connie
  
  class DictionaryNotFound < StandardError; end
  class DictionaryNameNotAllowed < StandardError; end
  
  @dictionaries = {}
  @alphabet = %w(a A b B c C d D e E f F g G h H i I j J k K l L m M n N o O p P q Q r R s S t T u U v V w W x X y Y z Z)
  
  def self.dictionaries_paths;@dictionaries_paths;end
  def self.dictionaries;@dictionaries;end
  
  def self.[] dictionary_name
    @dictionaries[dictionary_name.to_sym] or Dictionary.new(dictionary_name.to_s)
  end
  
  def self.register_dictionary(dictionary)
    @dictionaries[dictionary.name.to_sym] = dictionary
  end
  
  # Picks a random line from a text file
  def self.pick_a_line_from(file_path)
    File.open file_path, 'r' do |file|
      file.inject { |choice, line| rand < 1/file.lineno.to_f ? line.gsub(%r{\s$},'') : choice }
    end
  end
  
  def self.reload_dictionaries
    @dictionaries = {}
  end
  
  # Returns a random letter
  def self.letter(variant=nil)
    index = rand(26)*2
    index +=1 if variant == :uppercase
    @alphabet[index]
  end
  
  def self.digit
    rand(9)
  end

end