class Area < ApplicationRecord

	TABLA_FIELDS = [
		['area', 'show']
	]

	belongs_to :proyecto
end
