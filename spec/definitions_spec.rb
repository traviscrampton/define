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

    describe(".all") do
    it("is empty at first") do
      expect(Definition.all()).to(eq([]))
    end
  end

    describe("#save") do
    it('adds a definition to the array of saved definition') do
      test_definition = Definition.new("a lizard like amphibian")
      test_definition.save()
      expect(Definition.all()).to(eq([test_definition]))
    end
  end
  describe('.clear') do
    it ("empties out all of the saved vdefinition") do
      Definition.new("a lizard like amphibian").save()
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end

    describe(".find") do
    it("returns a definition by its id number") do
      test_definition = Definition.new("a large body of water")
      test_definition.save()
      test_definition2 = Definition.new('a significant other')
      test_definition2.save()
      expect(Definition.find(test_definition.id())).to(eq(test_definition))
    end
  end

end
