json.extract! reserva, :id, :anombre, :fecha, :n_personas, :n_contacto, :indicaciones, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)
