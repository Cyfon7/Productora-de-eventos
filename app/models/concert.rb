class Concert < ApplicationRecord
    belongs_to :group
    validates :concert_title, :num_of_attendants, :concert_date, :group_id, presence: true
    
    #Count concerts for specific ID group
    scope :concerts_of_group, -> (group_id) { Concert.group(:group_id).count[group_id] }
end
