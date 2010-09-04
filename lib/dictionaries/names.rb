module Connie
  module Names
    
    # Returns either a male or a female first name
    def first
      Connie [true, false] ? male : female
    end
    
    def gender
      Connie [true ,false] ? 'male' : 'female'
    end
    
    def title
      Connie [true, false] ? male_title : female_title
    end
    
  end
end