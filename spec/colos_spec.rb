require 'spec_helper'
require 'colos/version'

describe Colos do

  before do
    @colos_hex = Colos.new
    @colos_rgb = Colos.new format: :rgb
  end

  describe "VERSION" do
    subject { Colos::VERSION }
    it { should be_a String }
  end

  describe "#new" do
    it "should return instance" do
      Colos.new.should be_a Colos
    end

    it "should set options" do
      colos = Colos.new randomizr: 21
      colos.options[:randomizr].should == 21
    end
  end

  describe "#options" do
    describe "frequency" do
      it "should be correct" do
        colos = Colos.new frequency: 1.4
        colos.options[:frequency].should == 1.4
      end

      it "should raise error with 1.1" do
        expect { Colos.new frequency: 1.1 }.to raise_error
      end

      it "should raise error with 1.7" do
        expect { Colos.new frequency: 1.1 }.to raise_error
      end
    end

    describe "randomizr" do
      it "should be correct" do
        colos = Colos.new randomizr: 20
        colos.options[:randomizr].should == 20
      end

      it "should raise error with -1" do
        expect { Colos.new randomizr: -1 }.to raise_error
      end

      it "should raise error with 24" do
        expect { Colos.new randomizr: 24 }.to raise_error
      end
    end

    describe "format" do
      it "should be correct" do
        colos = Colos.new format: :hex
        colos.options[:format].should == :hex
      end

      it "should raise error with bad value" do
        expect { Colos.new format: :bad }.to raise_error
      end
    end
  end

  describe "#color" do
    it "'test' in hex should be '3a1be1'" do
      @colos_hex.color("test").should == "3a1be1"
    end

    it "'word' in hex should be '395e9a" do
      @colos_hex.color("word").should == "395e9a"
    end

    it "'test' in rgb should be '58, 27, 225'" do
      @colos_rgb.color("test").should == [58, 27, 225]
    end

    it "'word' in rgb should be '57, 94, 154'" do
      @colos_rgb.color("word").should == [57, 94, 154]
    end
  end

  describe "#colors" do
    it "'test' in hex should be ['ba6714', '3a1be1', '15291c']" do
      @colos_hex.colors("test").should == ["ba6714", "3a1be1", "15291c"]
    end

    it "'word' in hex should be '['b7d989', '395e9a', '14e8c0']'" do
      @colos_hex.colors("word").should == ["b7d989", "395e9a", "14e8c0"]
    end
  end

  describe "#ip" do
    it "'173.194.32.14' in hex should be 'adc220'" do
      @colos_hex.ip("173.194.32.14").should == "adc220"
    end

    it "'176.15.222.136' in hex should be 'b00fde'" do
      @colos_hex.ip("176.15.222.136").should == "b00fde"
    end

    it "'173.194.32.14' in rgb should be '173, 194, 32'" do
      @colos_rgb.ip("173.194.32.14").should == [173, 194, 32]
    end

    it "'176.15.222.136' in rgb should be '176, 15, 222'" do
      @colos_rgb.ip("176.15.222.136").should == [176, 15, 222]
    end

    it "should raise error" do
      expect { @colos_hex.ip "176.0.0" }.to raise_error
    end
  end

  describe "#ips" do
    it "first of '173.194.32.14' in hex should be 'adc220'" do
      @colos_hex.ips("173.194.32.14").first.should == "adc220"
    end

    it "first of '176.15.222.136' in hex should be 'b00fde'" do
      @colos_hex.ips("176.15.222.136").first.should == "b00fde"
    end

    it "should raise error" do
      expect { @colos_hex.ips "176.0.0" }.to raise_error
    end
  end
end
