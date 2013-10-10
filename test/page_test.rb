require './test/test_helper'

describe "page" do
  before do
    @page = Veda::Documentation.new("./test/test-docs")
  end

  it "should extract metadata from a single file" do
    meta = @page.fetch "sample"
  end

  it "should not crash when no markdown" do
    meta = @page.fetch "empty"
  end

  it "should extract metadata from a collection of files" do
    @page.collection
  end

  it "should use a slug as path if present"
end