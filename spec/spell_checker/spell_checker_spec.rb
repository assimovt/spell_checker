require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellChecker do

  before do
    @spell = SpellChecker.new
  end
  
  it 'should create a SpellChecker object' do
    @spell.should be_an_instance_of SpellChecker
  end
  
  it 'should return word with valid word' do
    @spell.correct('apple').should include('apple')
  end
  
  it 'should correct word with one typo' do
    @spell.correct('spple').should include('apple')
  end
  
  it 'should correct word with two typos' do
    @spell.correct('spplr').should include('apple')
  end
  
  it 'should correct word with extra chars' do
    @spell.correct('appplee').should include('apple')
  end
  
  it 'should correct word with extra chars and typos' do
    @spell.correct('applii').should include('apple')
  end
  
  it 'should correct incorrect vowel' do
    @spell.correct('ewaken').should include('awaken')
  end

  it 'should return nil if word not found' do
    @spell.correct('apppplii').should == []
  end

end