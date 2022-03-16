class Reserva < ApplicationRecord
	HORAS = ['13:00', '13:10', '13:20', '13:30', '13:40', '14:45', '14:55', '15:05', '15:15', '19:00', '19:10', '19:20', '19:30', '19:40', '20:45', '20:55', '21:05', '21:15']

	TABLA_FIELDS = [
		['anombre', 'normal'],
		['n_personas', 'normal'],
		['hora', 'normal']
	]
end
