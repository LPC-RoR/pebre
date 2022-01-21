class Reserva < ApplicationRecord
	HORAS = ['13:00', '13:30', '14:00', '14:30', '19:00', '19:30', '20:00']

	TABLA_FIELDS = [
		['anombre', 'normal'],
		['n_personas', 'normal'],
		['hora', 'normal']
	]
end
