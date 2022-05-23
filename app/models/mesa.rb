class Mesa < ApplicationRecord
	TABLA_FIELDS = [
#		['servicio',  'normal'],
		['zona',      'normal'],
		['mesa', 'normal']
	]

	has_many :res_mesas
	has_many :reservas, through: :res_mesas

end
