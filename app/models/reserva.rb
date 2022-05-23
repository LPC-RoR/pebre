class Reserva < ApplicationRecord
	HORAS = ['13:00', '13:10', '13:20', '13:30', '13:40', '14:45', '14:55', '15:05', '15:15', '19:00', '19:10', '19:20', '19:30', '19:40', '20:45', '20:55', '21:05', '21:15']

	MESAS = [1, 2, 3, 4, 5, 6]

	has_many :res_mesas
	has_many :mesas, through: :res_mesas

#	validates :anombre, :n_contacto, :n_personas, :hora, presence: true

	def ubicacion
		if self.mesas.empty?
			'-'
		else
			self.mesas.map {|mesa| mesa.mesa}.join('-')
		end
	end

end
