json.extract! compra, :id, :cartao_numero, :pin_cartao, :carrinho_id, :created_at, :updated_at
json.url compra_url(compra, format: :json)