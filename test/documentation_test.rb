require './test/test_helper'

describe "Veda::Documentation" do
  before do
    @documentation = Veda::Documentation.new("./test/test-repo")
  end

  it "should extract metadata from a single file" do
    meta = @documentation.fetch "file1"
  end

  it "should not crash when no yaml" do
    meta = @documentation.fetch "empty"
  end

  it "should extract metadata from a collection of files" do
    @documentation.collection
  end

  it "should extract an outline" do

  end

  it "should use a slug as path if present"
end