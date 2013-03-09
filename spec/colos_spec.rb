require 'spec_helper'

describe Colos do

  before do
    @colos = Colos.new
  end

  describe "#new" do
    it "should have correct frequency" do
      colos = Colos.new frequency: 1.4
      colos.options[:frequency].should == 1.4
    end

    it "should have correct randomizr" do
      colos = Colos.new randomizr: 20
      colos.options[:randomizr].should == 20
    end
  end

  describe "#color" do
    it "'test' should be '3a1be1'" do
      @colos.color("test").should == "3a1be1"
    end

    it "'word' should be '395e9a" do
      @colos.color("word").should == "395e9a"
    end
  end

  describe "#colors" do
    it "'test' should be ['ba6714', '3a1be1', '15291c']" do
      @colos.colors("test").should == ["ba6714", "3a1be1", "15291c"]
    end

    it "'word' should be '['b7d989', '395e9a', '14e8c0']'" do
      @colos.colors("word").should == ["b7d989", "395e9a", "14e8c0"]
    end
  end

  describe "#ip" do
    it "'173.194.32.14' should be 'adc220'" do
      @colos.ip("173.194.32.14").should == "adc220"
    end

    it "'176.15.222.136' should be 'b00fde'" do
      @colos.ip("176.15.222.136").should == "b00fde"
    end
  end

  describe "#ips" do
    it "first of '173.194.32.14' should be 'adc220'" do
      @colos.ips("173.194.32.14").first.should == "adc220"
    end

    it "first of '176.15.222.136' should be 'b00fde'" do
      @colos.ips("176.15.222.136").first.should == "b00fde"
    end

    it "last of '173.194.32.14' should be '0e20c2'" do
      @colos.ips("173.194.32.14").last.should == "0e20c2"
    end

    it "last of '176.15.222.136' should be '88de0f'" do
      @colos.ips("176.15.222.136").last.should == "88de0f"
    end

    it "size of '173.194.32.14' should be 24" do
      @colos.ips("173.194.32.14").size.should == 24
    end
  end

  describe "#options" do
    # write tests
  end
end
