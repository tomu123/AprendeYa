class Activity < ApplicationRecord
  enum activity_type: { clase: 'clase', ejercicio: 'ejercicio', recurso: 'recurso' }, _prefix: true
  belongs_to :unit
  has_one_attached :file
  has_many :solutions, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
  validates :file, presence: true
  validates :activity_type, presence: true
end
