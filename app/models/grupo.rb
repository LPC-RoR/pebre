class Grupo < ApplicationRecord

	TABLA_FIELDS = [
		['orden', 'normal'],
		['grupo', 'show']
	]

	has_many :items

end
