class Concert < ApplicationRecord
    belongs_to :group
    validates :concert_title, :num_of_attendants, :concert_date, :group_id, presence: true
    
    #Count concerts for specific ID group
    scope :concerts_of_group, -> (group_id) { Concert.group(:group_id).count[group_id] }

    #Totalize Attendands for specific ID group
    scope :group_attendants, -> (group_id) { Concert.where(group_id: group_id).sum(:num_of_attendants)}
end
