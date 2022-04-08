json.extract! reservacion, :id, :fecha, :servicio, :zona, :mesa, :pasajeros, :hora, :anombre, :n_contacto, :created_at, :updated_at
json.url reservacion_url(reservacion, format: :json)
