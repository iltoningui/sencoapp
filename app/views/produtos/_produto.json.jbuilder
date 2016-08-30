json.extract! produto, :id, :preco, :loja_id, :estado, :quantidade, :created_at, :updated_at
json.url produto_url(produto, format: :json)