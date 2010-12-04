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
    
    # Returns an array of same gender name and title
    def first_with_title
      Connie? ? [male_title, male] : [female_title, female]
    end
  end
end