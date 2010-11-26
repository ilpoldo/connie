module Connie
  module Names
    
    # Returns either a male or a female first name
    def first
      Connie? ? male : female
    end
    
    def gender
      Connie? ? 'male' : 'female'
    end
    
    def title
      Connie? ? male_title : female_title
    end
    
  end
end