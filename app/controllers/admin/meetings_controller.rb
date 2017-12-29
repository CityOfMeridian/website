module Admin
  class MeetingsController < Fae::NestedBaseController
    around_action :process_public_notice, only: [:create, :update]

    private
    
    def build_assets
      @item.build_agenda if @item.agenda.blank?
      @item.build_minutes if @item.minutes.blank?
    end

    def process_public_notice
      if params[:new_or_existing] == 'new'
        @public_notice = PublicNotice.new(
          title: params[:meeting][:public_notice_title],
          start_date: Date.current,
          end_date: params[:meeting][:date].to_date,
          organization: Organization.find(params[:meeting][:organization_id]))
      end
      yield
      @item.public_notices << @public_notice unless @public_notice.nil?
    end
  end
end
