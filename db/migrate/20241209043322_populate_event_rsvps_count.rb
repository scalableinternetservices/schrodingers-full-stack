class PopulateEventRsvpsCount < ActiveRecord::Migration[8.0]
  def change
    Event.all.each do |event|
      Event.reset_counters(event.id, :rsvps)
    end
  end
end
