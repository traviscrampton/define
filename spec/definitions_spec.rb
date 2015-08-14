require('rspec')
require('definition')

describe('Definition') do
  before() do
    Definition.clear
  end

    describe('#define') do
    it('returns the definition of the word') do
      test_definition = Definition.new("a lizard like amphibian")
      test_definition.save()
      expect(test_definition.define()).to(eq("a lizard like amphibian"))
    end
  end
end
