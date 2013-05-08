require 'spec_helper'

describe "A RubyDay 2013 speaker" do
  let(:speaker) { Speaker.new(:name=>"Jonh Doe", :github=>"johnny", :twitter=>"johnny", :url=>"http://www.johnny.com") }
  it "must be valid if created with sane parameters" do
    speaker.valid?.should   be_true
  end

  it "will have github link to be created for free" do
    speaker.github.should   == "https://github.com/johnny"
  end

  it "if filled with the whole github link it will save it" do
    speaker.github="https://github.com/thesp0nge"
    speaker.github.should   == "https://github.com/thesp0nge"
  end

  it "if filled with rubbish, github link is discarded" do
    speaker.github="http://www.google.com"
    speaker.github.should   == ""
  end
end
