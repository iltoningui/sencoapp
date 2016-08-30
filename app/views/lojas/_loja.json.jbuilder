json.extract! loja, :id, :nome, :email, :telefone, :created_at, :updated_at
json.url loja_url(loja, format: :json)