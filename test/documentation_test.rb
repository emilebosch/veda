require './test/test_helper'

describe "Veda::Documentation" do
  before do
    @documentation = Veda::Documentation.new("./test/test-repo")
  end

  it "should extract metadata from a single file" do
    meta = @documentation.fetch "file1"
    assert_equal 'How to: LXC from scratch', meta['title']
  end

  it "should match first heading as title" do
    meta = @documentation.fetch "without_meta"
    assert_equal 'This is the title', meta['title']
  end

  it "should not crash when no yaml" do
    meta = @documentation.fetch "empty"
    assert_equal 'empty', meta['id']
  end

  it "should extract metadata from a collection of files" do
    collection = @documentation.collection
    assert_equal 5, collection.size
  end

  it "should use a slug as path if present"
end