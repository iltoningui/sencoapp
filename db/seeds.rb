150.times do |l|
    p = Produto.create()
    g = Geral.create(preco: (rand 5000) * 110, classificacao: (rand 7) + 3, nome: "produto-#{l} - #{(rand 84)}",descricao: "descricao extensiva nº -#{l} - #{(rand 84)}",serviceable_id: p.id, serviceable_type: p.class, loja_id: (rand 84) + 1)
    p.save
    g.save
    p = Aluguer.create()
    g = Geral.create(preco: (rand 5000) * 110, classificacao: (rand 7) + 3, nome: "produto-#{l} - #{(rand 84)}",descricao: "descricao extensiva nº -#{l} - #{(rand 84)}",serviceable_id: p.id, serviceable_type: p.class, loja_id: (rand 84) + 1)
    p.save
    g.save
    p = Piteu.create()
    g = Geral.create(preco: (rand 5000) * 110, classificacao: (rand 7) + 3, nome: "produto-#{l} - #{(rand 84)}",descricao: "descricao extensiva nº -#{l} - #{(rand 84)}",serviceable_id: p.id, serviceable_type: p.class, loja_id: (rand 84) + 1)
    p.save
    g.save
    p = Servico.create()
    g = Geral.create(preco: (rand 5000) * 110, classificacao: (rand 7) + 3, nome: "produto-#{l} - #{(rand 84)}",descricao: "descricao extensiva nº -#{l} - #{(rand 84)}",serviceable_id: p.id, serviceable_type: p.class, loja_id: (rand 84) + 1)
    p.save
    g.save

end

Usuario.create(nome:'Admin', apelido: 'Senco', email:'admin@senco.com', password: '12345678', password_confirmation: '12345678', roles_mask: 1)
Usuario.create(nome:'Cliente', apelido: 'Senco', email:'cliente@senco.com', password: '12345678', password_confirmation: '12345678', roles_mask: 12)
