class Tweet < ApplicationRecord
  belongs_to :feed, optional: true
end
