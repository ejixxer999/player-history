class Team < ApplicationRecord
    belongs_to :city
    belongs_to :user
    accepts_nested_attributes_for :city, reject_if: :all_blank
end
