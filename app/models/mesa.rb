class Mesa < ApplicationRecord
	TABLA_FIELDS = [
#		['servicio',  'normal'],
		['ubicacion',      'normal'],
		['pasajeros', 'normal'],
		['horario',   'normal']
	]

	def ubicacion
		self.mesa + ' ' + self.zona
	end
end
