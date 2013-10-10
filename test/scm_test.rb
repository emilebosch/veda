describe "ScmFile" do

  before do
    @file = Veda::ScmFile.new "./test/test-repo", "file1.md"
  end

  it "should properly describe authors" do
    @file.authors
  end
  it "should propery describe log" do
    @file.log
  end

  it "should show the status of a indexed file"
  it "should show "
end

describe "ScmRepo" do

end