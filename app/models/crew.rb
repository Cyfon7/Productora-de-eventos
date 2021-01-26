class Crew < ApplicationRecord
  belongs_to :group
  validates :name, :group_id, presence: true

  #Find all Crews for group_id
  scope :crew_list, -> (group_id) {
    if self.where(group_id: group_id).exists?
      crews = self.where(group_id: group_id).pluck(:name)
      crews.join(', ')
    else
      " "
    end
  }

end
