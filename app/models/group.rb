class Group < ApplicationRecord
    has_many :concerts
    validates :group_name, :num_of_members, :debut_date, :group_type, presence: true

    enum group_type: [:men, :women, :band]

    

    def to_s
        group_name
    end
end
