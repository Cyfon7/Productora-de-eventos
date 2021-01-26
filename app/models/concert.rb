class Concert < ApplicationRecord
    belongs_to :group
    validates :concert_title, :num_of_attendants, :concert_date, :group_id, :concert_starts_at, :concert_ends_at, presence: true
    
    #Count concerts for specific ID group
    scope :concerts_of_group, -> (group_id) { 
        if self.where(group_id: group_id).exists?
            self.group(:group_id).count[group_id] 
        else
            0
        end
    }

    #Totalize Attendands for specific ID group
    scope :group_attendants, -> (group_id) { self.where(group_id: group_id).sum(:num_of_attendants)}

    #Count concerts for the actual month
    scope :concerts_this_month, -> (group_id) {
        concerts_month = 0
        if self.where(group_id: group_id).exists?
            concerts_date_bulk = self.where(group_id: group_id).pluck(:concert_date)
            actual_month = Time.now.month
            concerts_date_bulk.each do |date|
                if date.month == actual_month 
                    concerts_month += 1
                end
            end
        end
        concerts_month
    }

    #Last concert for the actual date
    scope :last_concert, -> (group_id) {
        if self.where(group_id: group_id).exists?
            last_date = self.where(group_id: group_id).order(concert_date: :desc).where('concert_date <= ?', Time.now).pluck(:concert_date)
            
            if last_date != []
                last_date[0].strftime("%Y-%B-%A")
            else
                "No concerts"
            end
        else
            "No concerts"
        end
    }

    #Max attendants in a concert
    scope :max_attendants, -> (group_id) {
        if self.where(group_id: group_id).exists?
            concert_max = self.where(group_id: group_id).order(num_of_attendants: :desc).first

            concert_max.num_of_attendants
        else
            0
        end
    }

    #Concert with the longest time
    scope :longest_concert, -> (group_id) {
        if self.where(group_id: group_id).exists?
            concerts_schedule = self.where(group_id: group_id).pluck(:concert_starts_at, :concert_ends_at)
            concert_duration = concerts_schedule.map do |schedule|
                hours = 0
                mins = 0
                if schedule[0].hour > schedule[1].hour
                    hours = (24 - schedule[0].hour) + schedule[1].hour
                else 
                    hours = schedule[1].hour - schedule[0].hour
                end
                
                mins = (60 - schedule[0].min) + schedule[1].min
                if mins >= 60
                    mins -= 60
                end
                Time.new(2000, 1, 1, hours, mins)
            end
            concert_duration.max.strftime("%H:%M")
        else
            "00:00"
        end
    }

end
