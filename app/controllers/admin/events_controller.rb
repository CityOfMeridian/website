module Admin
  class EventsController < Fae::BaseController
    before_action :set_times, only: [:new, :edit]


    private
    def set_times
      @times = []
      date = DateTime.new(2018, 1, 1, 8)
      (1..56).each do
        @times << [date.strftime("%l:%M%P").strip, date.strftime("%I:%M%P").strip]
        date += 15.minutes
      end 
    end
  end
end
