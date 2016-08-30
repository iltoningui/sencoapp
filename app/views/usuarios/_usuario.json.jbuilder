json.extract! usuario, :id, :nome, :apelido, :telefone, :genero, :data_de_nascimento, :roles_mask, :nome_da_empresa, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)