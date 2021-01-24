class Concert < ApplicationRecord
    belongs_to :group
    validates :concert_title, :num_of_attendants, :concert_date, presence: true
    

end
