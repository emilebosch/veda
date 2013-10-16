require './test/test_helper'

describe "Veda::Documentation" do
  before do
    @page = Veda::Documentation.new("./test/test-repo")
  end

  it "should extract metadata from a single file" do
    meta = @page.fetch "file1"
  end

  it "should not crash when no yaml" do
    meta = @page.fetch "empty"
  end

  it "should extract metadata from a collection of files" do
    @page.collection
  end

  it "should use a slug as path if present"
end