require 'spec_helper'

describe Event do
  
  describe 'dates' do
    before { @event = Event.new }  
  
    context "with start and end" do
      before do
        @event.start_date = Date.today; @event.end_date = Date.tomorrow
      end
      specify { expect(@event.dates).to eql([@event.start_date, @event.end_date].join(' - ')) }
    end

    context "with start date only" do
      before { @event.start_date = Date.today }
      specify { expect(@event.dates).to eql(Date.today) }
    end

    context "when nil" do
      specify { expect(@event.dates).to be_nil }
    end

  end

end
