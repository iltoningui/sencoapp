# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

$phone = 991000000
$lugares = {"maianga" => [[-8.8517927,13.2506721],[-8.8599342,13.2403724],[-8.8482307,13.2262961],[-8.8574382,13.2440773],
                          [-8.8369172,13.2440773],[-8.8218939,13.2316562],[-8.822483,13.2465616],[-8.834034,13.2461729]],

  "kilamba_kiaxi" => [
    [-8.8739767,13.2324911
    ],[-8.873584,13.2519674
    ],[-8.8848745,13.2293113
    ],[-8.8700495,13.269357
    ],[-8.8706217,13.2716023
    ],[-8.8672296,13.2710873]],

  "ingombota" => [
    [-8.8134134,13.2403102
    ],[-8.815181,13.255613
    ],[-8.8223491,13.2415026
    ],[-8.8134134,13.2609789
    ],[-8.8066379,13.2774742
    ],[-8.8029063,13.2924789
    ],[-8.8270624,13.2791634
    ],[-8.8826349,13.2310689
    ],[-8.8823404,13.2100026]],

  "belas" => [
    [-8.9236515,13.186633
    ],[-8.9241019,13.1862749
    ],[-8.9240735,13.185829
    ],[-8.9244444,13.185481
    ],[-8.9242059,13.1851839
    ],[-8.9243371,13.1849472
    ],[-8.9245597,13.1849372
    ],[-8.9240968,13.1859296
    ],[-8.9249094,13.185198]],

  "xyami_shopping" => [
    [-8.8964031,13.226483
    ],[-8.8965469,13.2265554
    ],[-8.8968311,13.2265574
    ],[-8.8968596,13.226251
    ],[-8.8970106,13.2262355
    ],[-8.8970364,13.2260632
    ],[-8.8971848,13.2260344]],

  "mutamba" => [
    [-8.814638,13.2319915
    ],[-8.8154649,13.23403
    ],[-8.8131643,13.2318735
    ],[-8.812719,13.2292556
    ],[-8.8102767,13.2379083
    ],[-8.8189599,13.2339279]],
  "camama" => [
    [-8.9150581,13.2647574
    ],[-8.9198489,13.2669246
    ],[-8.9201669,13.2580626
    ],[-8.9006974,13.2611118
    ],[-8.8995312,13.2610816
    ],[-8.9022027,13.26299
    ],[-8.9028438,13.2549828
    ],[-8.9023524,13.2549785
    ],[-8.9021167,13.2558768
    ],[-8.9019954,13.2563244
    ],[-8.9014663,13.2581341]],


  "rocha" => [
    [-8.8733536,13.2033541
    ],[-8.8602512,13.2146838
    ],[-8.8527458,13.213053
    ],[-8.8593183,13.2143834
    ],[-8.8656364,13.2111647
    ],[-8.8649348,13.21116
    ],[-8.865607,13.211371
    ],[-8.8659843,13.2114362
    ],[-8.8662103,13.2115033
    ],[-8.8664282,13.2115556
    ],[-8.8669649,13.2114718
    ],[-8.867216,13.2113491
    ],[-8.8677418,13.2110676
    ],[-8.8681684,13.2109534
    ],[-8.8689826,13.2106698
    ],[-8.8628973,13.2105686
    ],[-8.8631665,13.2108636]],

  "ulengo" => [
    [-8.9480717,13.2913676
    ],[-8.9479598,13.2914588
    ],[-8.9477902,13.2914574
    ],[-8.9476445,13.2915071
    ],[-8.9473523,13.2915788
    ],[-8.9470185,13.2919121
    ],[-8.9471258,13.2920442
    ],[-8.9477363,13.2916471
    ],[-8.9482822,13.2912911
    ],[-8.9487074,13.2909913
    ],[-8.9486272,13.2906978
    ],[-8.948563,13.2914105
    ],[-8.9488359,13.2917773],
   "talatona" => [[-8.9149494,13.1889568]],
   "gamek" => [[-8.8146684,13.2452389]],
   "benfica" => [[-8.95739,13.1562089]],
   "atrium" => [[-8.914394,13.291444]]
    ]}








def tel
  $phone = $phone + 1
end

def mail (nome = @representante_nome)

  "#{nome.gsub(' ', '.').to_s.downcase}@#{@representante_nome.gsub(" ", "").downcase}.com"
end

def pass
  "12345678"
end

def n1 nome
  nome.split(" ").first
end

def n2 nome
  nome.split(" ").last
end

def store (representante,loja)
  "#{representante} - #{loja}"
end

def cria_local(loja = "loja")
  id = 0
  lugar = ""
  if loja == "loja"
    id = @loja.id
    lugar = @loja_nome.downcase.gsub(" ","_").to_s
  else
    id = @representante.id
    lugar = "talatona".downcase.gsub(" ","_").to_s
  end

   lugar = "kilamba_kiaxi" if $lugares[lugar].nil?

  coordenadas = []

  if $lugares[lugar].length > 1
    coordenadas = $lugares[lugar][0]
    latitude = coordenadas[0] + (rand 1000).to_f/100000
    longitude = coordenadas[1] + (rand 1000).to_f/100000

  end

  localizacao = Localizacao.create(latitude: latitude, longitude: longitude, locationable_type: "Loja", locationable_id: id)
  localizacao.save
end

def cria_r
  @representante = Loja.create(nome: "#{@representante_nome}", email: "#{mail}", telefone: "#{tel}", estado: 4)
  ##Admin
  Usuario.create(nome: "#{n1 @admin}", apelido: "#{n2 @admin}", email: "#{mail @admin}", password: "#{pass}", password_confirmation: "#{pass}", roles_mask: 2, loja_id: @representante.id)
  ##Gestor
  Usuario.create(nome: "#{n1 @gerente}", apelido: "#{n2 @gerente}", email: "#{mail @gerente}", password: "#{pass}", password_confirmation: "#{pass}", roles_mask: 4, loja_id: @representante.id)
  ##Atendedor
  Usuario.create(nome: "#{n1 @atendedor}", apelido: "#{n2 @atendedor}", email: "#{mail @atendedor}", password: "#{pass}", password_confirmation: "#{pass}", roles_mask: 9, loja_id: @representante.id)
  ##Entregador
  Usuario.create(nome: "#{n1 @entregador}", apelido: "#{n2 @entregador}", email: "#{mail @entregador}", password: "#{pass}", password_confirmation: "#{pass}", roles_mask: 8, loja_id: @representante.id)
  cria_local("rhhhhhh")
end

def cria_l
  @loja = Loja.create(nome: "#{@representante_nome} - #{@loja_nome}", email: "#{mail}", telefone: "#{tel}", estado: 4)
  ##Admin
  Usuario.create(nome: "#{n1 @admin}", apelido: "#{n2 @admin}", email: "#{mail @admin}", password: "#{pass}", password_confirmation: "#{pass}", roles_mask: 2, loja_id: @loja.id)
  ##Gestor
  Usuario.create(nome: "#{n1 @gerente}", apelido: "#{n2 @gerente}", email: "#{mail @gerente}", password: "#{pass}", password_confirmation: "#{pass}", roles_mask: 4, loja_id: @loja.id)
  ##Atendedor
  Usuario.create(nome: "#{n1 @atendedor}", apelido: "#{n2 @atendedor}", email: "#{mail @atendedor}", password: "#{pass}", password_confirmation: "#{pass}", roles_mask: 9, loja_id: @loja.id)
  ##Entregador
  Usuario.create(nome: "#{n1 @entregador}", apelido: "#{n2 @entregador}", email: "#{mail @entregador}", password: "#{pass}", password_confirmation: "#{pass}", roles_mask: 8, loja_id: @loja.id)
  cria_local
end

@u = Usuario.create(nome:'Admin', apelido: 'Senco', email:'admin@senco.com', password: '12345678', password_confirmation: '12345678', roles_mask: 1)
@u = Usuario.create(nome:'Cliente', apelido: 'Senco', email:'cliente@senco.com', password: '12345678', password_confirmation: '12345678', roles_mask: 12)
localizacao = Localizacao.create(latitude: -8.8146684, longitude: 13.2452389, locationable_type: "Usuario", locationable_id: @u.id)
  localizacao.save

@u = Usuario.create(nome: "Adilson", apelido: "Mateus", email: "adilson.mateus@sendo.com", password: "12345678", password_confirmation: "12345678", roles_mask: 12)
localizacao = Localizacao.create(latitude: -8.95739, longitude: 13.1562089, locationable_type: "Usuario", locationable_id: @u.id)
  localizacao.save

@u = Usuario.create(nome:'Gedeao', apelido: 'Vitem', email:'gedeao.vtem@senco.com', password: '12345678', password_confirmation: '12345678', roles_mask: 12)
localizacao = Localizacao.create(latitude: -8.8631665, longitude: 13.2108636, locationable_type: "Usuario", locationable_id: @u.id)
  localizacao.save

@u = Usuario.create(nome: "Alfredo", apelido: "Tchipalanga", email: "alfredo.tchipalanga@sendo.com", password: "12345678", password_confirmation: "12345678", roles_mask: 12)
localizacao = Localizacao.create(latitude: -8.9149494, longitude: 13.1889568, locationable_type: "Usuario", locationable_id: @u.id)
  localizacao.save

@u = Usuario.create(nome:'Sebastião', apelido: 'Vambano', email:'cliente@senco.com', password: '12345678', password_confirmation: '12345678', roles_mask: 12)
localizacao = Localizacao.create(latitude: -8.914394, longitude: 13.291444, locationable_type: "Usuario", locationable_id: @u.id)
  localizacao.save

@u = Usuario.create(nome: "Cavelipa", apelido: "Tchipa", email: "cavelipa.tchipa@sendo.com", password: "12345678", password_confirmation: "12345678", roles_mask: 12)
localizacao = Localizacao.create(latitude: -8.834034, longitude: 13.2461729, locationable_type: "Usuario", locationable_id: @u.id)
  localizacao.save
 #########nos vestimos###########################################################################################################################
  ###representante
@representante_nome = "Nos Vestimos"
  @admin = "Jonas Vasco"
  @gerente = "Simao Paulo"
  @atendedor = "Joao Gustavo"
  @entregador = "Engracia Gomes"
  cria_r


  ###loja 1
  @loja_nome = "Gamek"
  @gerente = "Joao Cabanga"
  @atendedor = "Eleutério Carvalho"
  @entregador = "Jussena Milena"
  cria_l


  ###loja 2
  @loja_nome = "Talatona"
  @gerente = "Ivone Igor"
  @atendedor = "Miguel Gaspar"
  @entregador = "Jon Snow"
  cria_l

  ###loja 3
  @loja_nome = "Camama"
  @gerente = "Sergio Maziano"
  @atendedor = "Sersei Lanister"
  @entregador = "Theodore Sinclair"
  cria_l

  ###loja 4
  @loja_nome = "Belas"
  @gerente = "Dizando Norton"
  @atendedor = "Ned Stark"
  @entregador = "Rob Stark"
  cria_l

  ###loja 5
  @loja_nome = "Mutamba"
  @gerente = "Nemo Nunes"
  @atendedor = "White Walker"
  @entregador = "Tyrion Lanister"
  cria_l
###########################################################################################################################

#########  ###########################################################################################################################
###representante
@representante_nome = "Vasco Hamburgers"
  @administrador = "Vasco Turner"
  @gerente = "Antonio Andre"
  @atendedor = "Anderson Catumbela"
@entregador = "Gersin Francisco"
  cria_r

  ###loja 1
  @loja_nome = "Benfica"
  @gerente = "Sebastiao Antonio"
  @atendedor = "Andre Gomes"
  @entregador = "Carlos Andrade"
  cria_l

  ###loja 2
  @loja_nome = "Rocha"
  @gerente = "Agostinho Bismar"
  @atendedor = "Anita Sachova"
  @entregador = "Miguel Pinto"
  cria_l

  ###loja 3
  @loja_nome = "Benfica"
  @gerente = "Luis Sawa"
  @atendedor = "Evaristo Pedro"
  @entregador = "Eliana Cabanga"
  cria_l

  ###loja 4
  @loja_nome = "Xyami Shopping"
  @gerente = "cleidy Guerrs"
  @atendedor = "Nhareynice Alexandre"
  @entregador = "Pedro Maquina"
  cria_l

  ###loja 5
  @loja_nome = "Talatona"
  @gerente = "Antonio Lando"
  @atendedor = "Domingos Neto"
  @entregador = "Jose Vemba"
  cria_l
###########################################################################################################################

#########  ###########################################################################################################################
###representante
@representante_nome = "KFC"
  @administrador = "Chris Evans"
  @gerente = "Domingos tchupa"
  @atendedor = "Albertina Calupeteca"
  @entregador = "Laurinda Pires"
  cria_r

  ###loja 1
  @loja_nome = "Benfica"
  @gerente = "Albertina Lucamba"
  @atendedor = "Ivandro Alex"
  @entregador = "Suely Pedro"
  cria_l

  ###loja 2
  @loja_nome = "Ulengo"
  @gerente = "Clemencia Carlos"
  @atendedor = "Angelino Francisco"
  @entregador = "Abel Lazaro"
  cria_l

  ###loja 3
  @loja_nome = "Ingombota"
  @gerente = "Roger Conceicao"
  @atendedor = "Darizia Lima"
  @entregador = "Pirlo Costa"
  cria_l

  ###loja 4
  @loja_nome = "Xyami Shopping"
  @gerente = "Lionel Messi"
  @atendedor = "Andre Iniesta"
  @entregador = "Neymar Junior"
  cria_l

  ###loja 5
  @loja_nome = "Talatona"
  @gerente = "Xavi Masquerano"
  @atendedor = "Angel Dimaria"
  @entregador = "Cristiano Ronaldo"
  cria_l
###########################################################################################################################
#########  ###########################################################################################################################
###representante
@representante_nome = "Unitel"
  @administrador = "Katlin Stark"
  @gerente = "Munir Catana"
  @atendedor = "Octavio Costa"
  @entregador = "Nelson Kumba"
  cria_r

  ###loja 1
  @loja_nome = "Atrium"
  @gerente = "Tumbula Padre"
  @atendedor = "Inacio Almeida"
  @entregador = "Manuel Cadete"
  cria_l

  ###loja 2
  @loja_nome = "Benfica"
  @gerente = "Kinanga Pepe"
  @atendedor = "Pepy Guardiola"
  @entregador = "Mourinho Treinador"
  cria_l

  ###loja 3
  @loja_nome = "Rocha"
  @gerente = "Alexandrino Francisco"
  @atendedor = "Naomi Muangui"
  @entregador = "Ailton Gerson"
  cria_l

  ###loja 4
  @loja_nome = "Xyami Shopping"
  @gerente = "Darline Sanxelz"
  @atendedor = "Vicente Charpe"
  @entregador = "Vilma Gertrudes"
  cria_l

  ###loja 5
  @loja_nome = "Talatona"
  @gerente = "Dino Malaquia"
  @atendedor = "Darcia Primeiro"
  @entregador = "Mario Baloteli"
  cria_l
###########################################################################################################################
#########  ###########################################################################################################################
###representante
@representante_nome = "Movicel"
  @administrador = "Emilia Clark"
  @gerente = "Isen Bolton"
  @atendedor = "Hilaria Clinton"
  @entregador = "Valente Edvaldo"
  cria_r

  ###loja 1
  @loja_nome = "Atrium"
  @gerente = "Edvaldo Paca"
  @atendedor = "Diakondua Ranchu"
  @entregador = "Diolinda Rodrigues"
  cria_l

  ###loja 2
  @loja_nome = "Benfica"
  @gerente = "Ernesto Bartolomeu"
  @atendedor = "Francisca Carloss"
  @entregador = "Cahisso Bongo"
  cria_l

  ###loja 3
  @loja_nome = "Rocha"
  @gerente = "Josemar Manuell"
  @atendedor = "Tina Tchicola"
  @entregador = "Maria Santana"
  cria_l

  ###loja 4
  @loja_nome = "Xyami Shopping"
  @gerente = "Santa Maria"
  @atendedor = "Mariana Sousa"
  @entregador = "Silva Marques"
  cria_l

  ###loja 5
  @loja_nome = "Talatona"
  @gerente = "Meidy Ricardo"
  @atendedor = "Jose Victorio"
  @entregador = "Domingas Quantum"
  cria_l
###########################################################################################################################
#########  ###########################################################################################################################
###representante
@representante_nome = "Restaurante Grill"
  @administrador = "Khal Drogo"
  @gerente = "Gilberto Lopes"
  @atendedor = "Janeth Coelho"
  @entregador = "Celia Melo"
  cria_r

  ###loja 1
  @loja_nome = "Atrium"
  @gerente = "Anilca Cabral"
  @atendedor = "Isandra Campus"
  @entregador = "Marlene Gloria"
  cria_l

  ###loja 2
  @loja_nome = "Benfica"
  @gerente = "Barbosa Sol"
  @atendedor = "Eugenia Cita"
  @entregador = "Neila Kinta"
  cria_l

  ###loja 3
  @loja_nome = "Ingombota"
  @gerente = "Sontos Santos"
  @atendedor = "Olivia Silva"
  @entregador = "Santana Cristian"
  cria_l

  ###loja 4
  @loja_nome = "Xyami Shopping"
  @gerente = "Souza Lourenco"
  @atendedor = "Joao Ngoma"
  @entregador = "Belchior Silva"
  cria_l

  ###loja 5
  @loja_nome = "Talatona"
  @gerente = "Ferreia Silva"
  @atendedor = "Rodrigues Chirs"
  @entregador = "Clark Kent"
  cria_l
###########################################################################################################################
#########  ###########################################################################################################################
###representante
@representante_nome = "Comer Ate Cair"
  @administrador = "Veronica Cruz"
  @gerente = "Chris Brown"
  @atendedor = "Ketin Perry"
  @entregador = "Pereira Pereira"
  cria_r

  ###loja 1
  @loja_nome = "Atrium"
  @gerente = "Evora Lima"
  @atendedor = "Lima Carlos"
  @entregador = "Rodrigues Paulo"
  cria_l

  ###loja 2
  @loja_nome = "Benfica"
  @gerente = "Gomes Alves"
  @atendedor = "Pirlo Pereira"
  @entregador = "Andre Alves"
  cria_l

  ###loja 3
  @loja_nome = "Rocha"
  @gerente = "Maria Fatima"
  @atendedor = "Edson Marques"
  @entregador = "Edmilson Figo"
  cria_l

  ###loja 4
  @loja_nome = "Xyami Shopping"
  @gerente = "Almeida Roger"
  @atendedor = "Carvalho Almeida"
  @entregador = "Marques Vieira"
  cria_l

  ###loja 5
  @loja_nome = "Talatona"
  @gerente = "Robertos Carlos"
  @atendedor = "Kim Ribeiro"
  @entregador = "John Johonson"
  cria_l
###########################################################################################################################
#########  ###########################################################################################################################
###representante
@representante_nome = "Auto Reparacoes"
  @administrador = "Alfredo Tchipalanga"
  @gerente = "Andrade Quim"
  @atendedor = "Vieira Queiroz"
  @entregador = "Carvalho Queiroz"
  cria_r

  ###loja 1
  @loja_nome = "Atrium"
  @gerente = "Aurojo Pinto"
  @atendedor = "Soares Diniz"
  @entregador = "Souza Fernadess"
  cria_l

  ###loja 2
  @loja_nome = "Benfica"
  @gerente = "Santana Diniz"
  @atendedor = "Santana Branca"
  @entregador = "Brindes Araujo"
  cria_l

  ###loja 3
  @loja_nome = "Rocha"
  @gerente = "Dimas Pinheiro"
  @atendedor = "Agostinho Neto"
  @entregador = "Maria Borge"
  cria_l

  ###loja 4
  @loja_nome = "Xyami Shopping"
  @gerente = "Mario Borge"
  @atendedor = "Mario Andrade"
  @entregador = "Afrodite Paca"
  cria_l

  ###loja 5
  @loja_nome = "Talatona"
  @gerente = "Pipas Nodua"
  @atendedor = "Suzeth cordeiro"
  @entregador = "Mutu Kevela"
  cria_l
###########################################################################################################################
#########  ###########################################################################################################################
###representante
@representante_nome = "Final Feliz"
  @administrador = "Sebastiao Vambano"
  @gerente = "Oteniel Marcos"
  @atendedor = "Maria Natalia"
  @entregador = "Helena Ana"
  cria_r

  ###loja 1
  @loja_nome = "Atrium"
  @gerente = "Carlos Paulo"
  @atendedor = "Celia Pinpim"
  @entregador = "Isabel Bamba"
  cria_l

  ###loja 2
  @loja_nome = "Benfica"
  @gerente = "Olavio Agostinho"
  @atendedor = "Agostinho Jose"
  @entregador = "Jose Olavio"
  cria_l

  ###loja 3
  @loja_nome = "Rocha"
  @gerente = "Elka Kay"
  @atendedor = "Kay Edson"
  @entregador = "Neto Vava"
  cria_l

  ###loja 4
  @loja_nome = "Xyami Shopping"
  @gerente = "Malcon Valete"
  @atendedor = "Karol Malaquias"
  @entregador = "Antonia Suzalina"
  cria_l

  ###loja 5
  @loja_nome = "Talatona"
  @gerente = "Anderson Catumbela"
  @atendedor = "Abeliz Lazaro"
  @entregador = "Roger Abel"
  cria_l
###########################################################################################################################
#########  ###########################################################################################################################
###representante
@representante_nome = "Auto Completo"
  @administrador = "Jacinto Mundianguila"
  @gerente = "Aurelio Luso"
  @atendedor = "Luso Piri"
  @entregador = "Piri Aurelio"
  cria_r

  ###loja 1
  @loja_nome = "Atrium"
  @gerente = "Dayson Lima"
  @atendedor = "Edna Arsenio"
  @entregador = "Edvaldo Arsenio"
  cria_l


  ###loja 2
  @loja_nome = "Benfica"
  @gerente = "Pikiny Chicola"
  @atendedor = "Eleuterio Campus"
  @entregador = "carvalio Capri"
  cria_l

  ###loja 3
  @loja_nome = "Ingombota"
  @gerente = "Beatriz Ernestro"
  @atendedor = "Aida Faztudo"
  @entregador = "Dani Augusto"
  cria_l

  ###loja 4
  @loja_nome = "Xyami Shopping"
  @gerente = "Jonacio Txissola"
  @atendedor = "Lili Felicia"
  @entregador = "Ed Lacalete"
  cria_l

  ###loja 5
  @loja_nome = "Talatona"
  @gerente = "Gerson Sebastiaos"
  @atendedor = "Eduardo Lima"
  @entregador = "Anilde Hossi"
  cria_l
###########################################################################################################################
#########  ###########################################################################################################################
###representante
@representante_nome = "Eletricista Gomes"
  @administrador = "Barack Obama"
  @gerente = "Hossi Andree"
  @atendedor = "Carla Conceicaos"
  @entregador = "Guilherme Zangui"
  cria_r

  ###loja 1
  @loja_nome = "Atrium"
  @gerente = "Pedro Nzambi"
  @atendedor = "Madalena Anjo"
  @entregador = "Lau Palanca"
  cria_l

  ###loja 2
  @loja_nome = "Benfica"
  @gerente = "Victoria Simba"
  @atendedor = "Simba Ferreia"
  @entregador = "Simba Nduzi"
  cria_l

  ###loja 3
  @loja_nome = "Ingombota"
  @gerente = "Stelvio Torcato"
  @atendedor = "Torcato pedro"
  @entregador = "Rita Marques"
  cria_l

  ###loja 4
  @loja_nome = "Xyami Shopping"
  @gerente = "Lovicia Ricardo"
  @atendedor = "Ricardo Avelino"
  @entregador = "Avelina Nana"
  cria_l

  ###loja 5
  @loja_nome = "Talatona"
  @gerente = "Loyde Tchivinda"
  @atendedor = "Sonts Joao"
  @entregador = "Wilson Lemos"
  cria_l
###########################################################################################################################
#########  ###########################################################################################################################
###representante
@representante_nome = "So Correia"
  @administrador = "Victor Crum"
  @gerente = "Lemos Nascimento"
  @atendedor = "Augusta Caputo"
  @entregador = "Caputo Andre"
  cria_r

  ###loja 1
  @loja_nome = "Atrium"
  @gerente = "Bula Scout"
  @atendedor = "Scout Andre"
  @entregador = "Edsonm Cabanga"
  cria_l

  ###loja 2
  @loja_nome = "Benfica"
  @gerente = "Manuel Fonseca"
  @atendedor = "Agnel Cabral"
  @entregador = "Maria Sousa"
  cria_l

  ###loja 3
  @loja_nome = "Ingombota"
  @gerente = "Antoine Francisco"
  @atendedor = "Auria Santos"
  @entregador = "Jesus Anderson"
  cria_l

  ###loja 4
  @loja_nome = "Xyami Shopping"
  @gerente = "Eurico Victor"
  @atendedor = "Victor Claudio"
  @entregador = "Jose Mandes"
  cria_l

  ###loja 5
  @loja_nome = "Talatona"
  @gerente = "Edmilson Yessoll"
  @atendedor = "Jose Girassol"
  @entregador = "Elizabeth Calombe"
  cria_l
###########################################################################################################################
#########  ###########################################################################################################################
###representante
@representante_nome = "NCR"
  @administrador = "Mateus De Carvalho"
  @gerente = "Emilia Fernandes"
  @atendedor = "Florinda Paulo"
  @entregador = "Braga Gabriel"
  cria_r

  ###loja 1
  @loja_nome = "Atrium"
  @gerente = "Gerge Novas"
  @atendedor = "Indira Lopes"
  @entregador = "Lopes Neves"
  cria_l

  ###loja 2
  @loja_nome = "Benfica"
  @gerente = "Lucelia Miguel"
  @atendedor = "Adelino Campus"
  @entregador = "Miguel Avelina"
  cria_l

  ###loja 3
  @loja_nome = "Ingombota"
  @gerente = "Didinho Bangu"
  @atendedor = "Elizabeth Francisquinha"
  @entregador = "Eury Frank"
  cria_l

  ###loja 4
  @loja_nome = "Xyami Shopping"
  @gerente = "Geroge Figuras"
  @atendedor = "Helcio Mendes"
  @entregador = "mendes Galaxya"
  cria_l

  ###loja 5
  @loja_nome = "Talatona"
  @gerente = "Mendes Nasse"
  @atendedor = "Nelma Chingu"
  @entregador = "Chimuco Eularia"
  cria_l
###########################################################################################################################

#########  ###########################################################################################################################
###representante
@representante_nome = "Angola Telecon"
  @administrador = "Fabio Ferreira"
  @gerente = "Nilda Eurinha"
  @atendedor = "lacinha Paulo"
  @entregador = "Patricia tiago"
  cria_r

  ###loja 1
  @loja_nome = "Atrium"
  @gerente = "Patricio Weber"
  @atendedor = "Pedro Tiago"
  @entregador = "Tiago Sousa"
  cria_l

  ###loja 2
  @loja_nome = "Benfica"
  @gerente = "Rosa Guerra"
  @atendedor = "Suely Massarico"
  @entregador = "Samuel Zamba"
  cria_l

  ###loja 3
  @loja_nome = "Ingombota"
  @gerente = "Samuel Hossi"
  @atendedor = "Tamba Ribeiro"
  @entregador = "Victorio Santoss"
  cria_l

  ###loja 4
  @loja_nome = "Xyami Shopping"
  @gerente = "Venancia Vemba"
  @atendedor = "Vila Pereira"
  @entregador = "Pedrosa Mande"
  cria_l

  ###loja 5
  @loja_nome = "Talatona"
  @gerente = "Malu Francisco"
  @atendedor = "Binha Andres"
  @entregador = "Clementina Pinto"
  cria_l
###########################################################################################################################

100.times do |l|
 #   p = Produto.create()
  #  g = Geral.create(nome: "produto-#{l} - #{(rand 84)}",descricao: "descricao extensiva nº -#{l} - #{(rand 84)}",serviceable_id: p.id, serviceable_type: p.class, loja_id: (rand 84))
   # p.save
  #  g.save
  #  p = Aluguer.create()
   # g = Geral.create(nome: "produto-#{l} - #{(rand 84)}",descricao: "descricao extensiva nº -#{l} - #{(rand 84)}",serviceable_id: p.id, serviceable_type: p.class, loja_id: (rand 84))
#    p.save
 #   g.save
  #  p = Piteu.create()
   # g = Geral.create(nome: "produto-#{l} - #{(rand 84)}",descricao: "descricao extensiva nº -#{l} - #{(rand 84)}",serviceable_id: p.id, serviceable_type: p.class, loja_id: (rand 84))
#    p.save
 #   g.save
  #  p = Servico.create()
   # g = Geral.create(nome: "produto-#{l} - #{(rand 84)}",descricao: "descricao extensiva nº -#{l} - #{(rand 84)}",serviceable_id: p.id, serviceable_type: p.class, loja_id: (rand 84))
 #   p.save
  #  g.save

#end
