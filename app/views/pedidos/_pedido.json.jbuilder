json.extract! pedido, :id, :estado, :quantidade, :desconto, :preco_unitario, :preco_total, :tipo, :usuario_id, :geral_id, :loja_id, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)