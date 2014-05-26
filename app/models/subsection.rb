class Subsection < ActiveRecord::Base
  belongs_to :section
  validates :name, presence: true
  validates :section_id, presence: true
end
