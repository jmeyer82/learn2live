class User < ApplicationRecord
#   scope :red, -> { where(color: 'red') }
    scope :sharer, -> { where(profile_type: 'Sharer')}
    scope :seeker, -> { where(profile_type: 'Seeker')}
end
