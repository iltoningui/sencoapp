json.extract! horario, :id, :dia, :entrada, :saida.time, :loja_id, :created_at, :updated_at
json.url horario_url(horario, format: :json)