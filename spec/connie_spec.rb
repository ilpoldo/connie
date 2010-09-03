require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Connie, 'api' do
  
  before(:each) do
    Connie.reload_dictionaries
  end
  
  it "returns elements off a dictionary" do
    Connie(:'names.male').should eql('Mark')
  end
  
  it "returns a dictionary using the shorthand" do
    Connie(:names).male.should eql('Mark')
  end
  
  it "returns a dictionary using []" do
    Connie[:names].male.should eql('Mark')
  end
  
  it "parses a string passed" do
    Connie ':names.male :names.surname'
    pending
  end
  
  it "has a nifty revex syntax" do
    Connie '\w{3,4}'
    pending
  end
  
  it "returns access to a family of dictionaries" do
    Connie[:names].class.should eql(Connie::Dictionary)
  end
  
  it "has a couple of core functions" do
    Connie.letter.should match(%r{[a-z]})
    Connie.digit.to_s.should match(%r{[0-9]})
  end
  
  it "supports overriding generators" do
    module Connie
      module Names
        def misspelled_name
          name = male
          name[rand(name.size)] += 1
        end
      end
    end
    
    Connie[:names].misspelled_name
  end
  
  it "can store possible formats in a dictionary" do
    #Connie.compose[:story] == Connie(Connie[:story]) # the story dictionary is in connie syntax
    pending
  end
  
end


describe Connie, 'dictionaries' do
  it "picks name form a dictionary" do
    Connie.dictionaries[:names].should_receive(:male)
    
    Connie(:names).male
  end
  
  it "supports hierarchical sources" do
    source = {:italian => %w(pasta pizza polenta), :spanish => %w(tortilla gazpacho chorizo)}
    pending
  end
  
  it "should warn in case of double dictionary" do
    pending
  end
end