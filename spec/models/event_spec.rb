require 'spec_helper'

describe Event do
  
  describe 'dates' do
    before { @event = Event.new }  
  
    context "with start and end" do
      before do
        @event.start_date = Date.today; @event.end_date = Date.tomorrow
      end
      specify { @event.dates.should eql([@event.start_date, @event.end_date].join(' - ')) }
    end

    context "with start date only" do
      before { @event.start_date = Date.today }
      specify { @event.dates.should eql(Date.today) }
    end

    context "when nil" do
      specify { @event.dates.should be_nil }
    end

  end

end
