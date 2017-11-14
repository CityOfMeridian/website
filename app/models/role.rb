module Fae
  class Role < ActiveRecord::Base
    has_one :organization
  end
end