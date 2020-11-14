class Turma < ApplicationRecord
  has_many :atividades, dependent: :destroy

  validates :name, presence: true
end
