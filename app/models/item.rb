class Item < ApplicationRecord

	TABLA_FIELDS = [
		['orden', 'normal'],
		['codigo', 'normal'],
		['item', 'show'],
		['precio', 'normal']
	]

	belongs_to :grupo
end
