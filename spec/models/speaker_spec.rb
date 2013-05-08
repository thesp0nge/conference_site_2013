require 'spec_helper'

describe "A RubyDay 2013 speaker" do
  let(:speaker) { Speaker.new(:name=>"Jonh Doe", :github=>"johnny", :twitter=>"johnny", :url=>"http://www.johnny.com") }
  it "must be valid if created with sane parameters" do
    speaker.valid?.should   be_true
  end

  context "will have a github link" do

    it "created for free" do
      speaker.github.should   == "https://github.com/johnny"
    end

    it "saved as is if filled with the whole github link" do
      speaker.github="https://github.com/thesp0nge"
      speaker.github.should   == "https://github.com/thesp0nge"
    end

    it "discarded if if filled with rubbish" do
      speaker.github="http://www.google.com"
      speaker.github.should   == ""
    end
  end

  context "will have a twitter link" do

    it "created for free" do
      speaker.twitter.should   == "https://twitter.com/johnny"
    end

    it "saved as is if filled with the whole twitter link" do
      speaker.twitter="https://twitter.com/thesp0nge"
      speaker.twitter.should   == "https://twitter.com/thesp0nge"
    end

    it "discarded if if filled with rubbish" do
      speaker.twitter="http://www.google.com"
      speaker.twitter.should   == ""
    end
  end

  context "will have a personal link" do
    it "that is sane" do
      speaker.url.should == "http://www.johnny.com"
    end
    it "that is discarded if filled up with something that is not an url" do 
      speaker.url = "a rubbish here"
      speaker.url.should == ""
    end
  end

end
