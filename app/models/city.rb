class City < ApplicationRecord
    has_many :teams
    has_many :users, through: :teams
    # accepts_nested_attributes_for :team, reject_if: :all_blank

    scope :order_by_name, -> {order(name: :asc)}
end
