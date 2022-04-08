json.extract! detalle_reserva, :id, :fecha, :servicio, :salon, :mesa, :horario, :created_at, :updated_at
json.url detalle_reserva_url(detalle_reserva, format: :json)
