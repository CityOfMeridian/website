class PublicNoticesController < ApplicationController

  def index
    @public_notices = PublicNotice.active
  end

  def show
  end

  def noticeable

  end
end
