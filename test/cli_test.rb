require './test/test_helper'

describe "cli" do
	it "should start serving documentation from current directory when no command given"
	it "should give help options when help command given"
	it "should serve the right documention when given directory"
end

describe "library" do
  it "should add documentation to library when using 'veda clone emilebosch/kitesurfing'"
  it "should add documentation to current direcorry when using 'veda clone emilebosch/kitesuring .'"
  it "should clone+view when usig view 'veda view emilebosch/kitesurfing"
end