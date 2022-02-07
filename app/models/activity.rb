class Activity < ApplicationRecord
  enum activity_type: { clase: 'clase', ejercicio: 'ejercicio', recurso: 'recurso' }, _prefix: true
  belongs_to :unit
  has_one_attached :file
  has_many :solutions
  validates :title, presence: true
  validates :description, presence: true
end
