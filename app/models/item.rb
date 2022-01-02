class Item < ApplicationRecord

	TABLA_FIELDS = [
		['orden', 'normal'],
		['item', 'show']
	]

	belongs_to :grupo
end
