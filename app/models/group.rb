class Group < ApplicationRecord
    has_many :concerts, dependent: :destroy
    has_many :crews, dependent: :destroy

    accepts_nested_attributes_for :crews,
                                  allow_destroy: true,
                                  reject_if: proc { |attributes| attributes['name'].blank? }

    validates :group_name, :num_of_members, :debut_date, :group_type, presence: true

    enum group_type: [:men, :women, :band]

    def to_s
        group_name
    end
end
