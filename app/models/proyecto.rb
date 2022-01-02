class Proyecto < ApplicationRecord

	TABLA_FIELDS = [
		['proyecto', 'show']
	]

	has_many :areas

end
