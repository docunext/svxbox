require File.dirname(__FILE__) + '/spec_helper'

require File.dirname(File.dirname(__FILE__)) + '/lib/svxbox/immutable'

class AnonyClass
end

describe SvxBox do

  context "Immutable" do
    before(:each) do
      @anony_class = AnonyClass.new
      @anony_class.extend(SvxBox::Immutable)
    end
    describe "check methods" do
      subject { @anony_class }
      it { should respond_to(:destroy) }
    end
  end
end
