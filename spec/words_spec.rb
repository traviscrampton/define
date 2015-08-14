require('rspec')
require('word')
require('definition')

describe(Word) do
  before() do
    Word.clear()
  end

  describe('#name') do
    it('returns the word name') do
      test_word = Word.new('Salamander')
      expect(test_word.name()).to(eq('Salamander'))
    end
  end
end
