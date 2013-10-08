require './test/test_helper'

describe "page" do

	before do
		@page = Veda::Documentation.new("./test/test-docs")
	end

	it "should extract metadata from a single file" do
		@page.fetch "sample"
	end

	it "should extract metadata from a collection of files" do
		@page.collection
	end

	it "should not crash when no markdown" do
	end
end