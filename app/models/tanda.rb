class Tanda < ApplicationRecord

	# DEPRECATED
	# HORAS = ['13:00', '13:10', '13:20', '13:30', '13:40', '14:45', '14:55', '15:05', '15:15', '19:00', '19:10', '19:20', '19:30', '19:40', '20:45', '20:55', '21:05', '21:15']

	TABLA_FIELDS = [
		['turno', 'normal'],
		['horario', 'normal'],
		['capacidad', 'normal']
	]

	def activa(fecha)
		cierres_fecha = Cierre.where(fecha: fecha)
		if cierres_fecha.empty?
			true
		else
			cierre_tanda = cierres_fecha.where(horario: self.horario)
			if cierre_tanda.empty?
				true
			else
				false
			end
		end
	end

end
