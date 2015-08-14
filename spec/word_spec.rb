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

  describe('#id') do
    it('returns the id of the word') do
      test_word = Word.new("Salamander")
      expect(test_word.id()).to(eq(1))
    end
  end

  describe('#word_bank') do
    it('initially returns an empty array of definitions for the words') do
      test_word = Word.new("Salamander")
      expect(test_word.word_bank()).to(eq([]))
    end
  end

  describe(".all") do
    it('is empty at first') do
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a word to the array of saved words") do
      test_word = Word.new("Salamander")
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe('#clear') do
    it('empties out all of the saved words') do
      Word.new('Salamander').save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('returns a dealership by its id number') do
      test_word = Word.new('Salamander')
      test_word.save()
      test_word2 = Word.new('Concentrate')
      test_word2.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end

  # describe('#add_definition') do
  #   it("adds a new vehicle to a dealership") do
  #     test_word = Word.new('Concentrate')
  #     test_definition = Definition.new('To focus intensely')
  #     test_word.add_definition(test_definition)
  #     expect(test_word.word_bank()).to(eq([test_definition]))
  #   end
  # end
end
