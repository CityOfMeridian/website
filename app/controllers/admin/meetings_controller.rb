module Admin
  class MeetingsController < Fae::NestedBaseController


    private
    
    def build_assets
      @item.build_agenda if @item.agenda.blank?
      @item.build_minutes if @item.minutes.blank?
    end
  end
end
