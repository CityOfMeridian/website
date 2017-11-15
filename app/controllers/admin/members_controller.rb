module Admin
  class MembersController < Fae::NestedBaseController

    def create
      @member = Member.find(params[:id])
      Organization.EXPECTED_LEADER_TITLES.each do |title|
        @member.organization_led = @member.organization if params[title.to_sym]
      end
      super
    end

    private

    def build_assets
      @item.build_image if @item.image.blank?
    end

  end
end
