# loomi_player

Um projeto desenvolvido com flutter para um cliente que busca funcionar
como um “streaming” de vídeo, no qual haverão filmes em cartaz que o usuário
poderá assistir.

# 🛠️ Funcionalidades

- ✅ [Funcionalidade 1 - Login com autenticação Firebase]
- ✅ [Funcionalidade 2 - Registro com autenticação Firebase]
- ✅ [Funcionalidade 3 - Recuperação de senha com autenticação Firebase]
- ✅ [Funcionalidade 4 - Redefinição de senha com autenticação Firebase]
- ✅ [Funcionalidade 5 - Exibição de video]
- ✅ [Funcionalidade 6 - Reprodução de video]
- ✅ [Funcionalidade 7 - Listagem de video]
- ✅ [Funcionalidade 8 - Armazenamento de dados no firestore]

# 🚀 Tecnologias Utilizadas

- Flutter (SDK principal)
- Dart (linguagem de programação)
- Firebase (necessário realizar as configurações do firebase no projeto)
- Mobx

# 📂 Estrutura do Projeto
```
lib/
├── core/
│   ├── constants/      # Constantes, temas, assets
│   ├── services/       # Serviços de API, interações com Firebase
│   ├── utils/          # Funções auxiliares, validadores
│   └── di/             # Injeção de dependência com GetIt
├── data/
│   ├── models/         # Modelos de dados com json_serializable
│   ├── repositories/   # Repositórios para lógica de dados (API, local)
│   └── sources/        # Fontes de dados: API (Dio)
├── domain/
│   ├── entities/       # Entidades de negócio
│   ├── usecases/       # Lógica de negócio (casos de uso)
|   ├── repository/     # Interfaces para acesso a dados.
├── presentation/
│   ├── pages/          # Telas e componentes de UI
│   ├── widgets/        # Widgets reutilizáveis
│   └── stores/         # Gerenciamento de estado com MobX
└── main.dart           # Ponto de entrada do app

```

## 1. Core (Núcleo do Projeto)

  Essa pasta contém os elementos centrais do app, que podem ser   reutilizados em diferentes partes do código. Ela serve como   um "coração" do projeto.

- **constants/**

  Aqui ficam constantes, como cores, strings, e temas. Isso   ajuda a centralizar as definições que podem ser usadas em   todo o app.

- **services/**

  Serviços usados pelo app, como integração com APIs ou Firebase. Cada serviço  tem uma responsabilidade clara.

- **utils/**

  Funções ou classes auxiliares que não se encaixam em outras categorias.

- **di/ (Dependency Injection - Injeção de Dependência)**

  Contém a configuração do GetIt, que gerencia as dependências do projeto, como serviços e repositórios.

## 2. Data (Dados do Projeto)

Essa pasta é responsável por armazenar a lógica relacionada a dados externos e locais.

- **models/**

  Contém os modelos de dados usados no app. Ex. json_serializable para facilitar a conversão de JSON para objeto e vice-versa.

- **repositories/**

  Contém a lógica de negócio e faz a ponte entre as fontes de dados

- **sources/**

  Fontes de dados, como APIs externas (com Dio e Retrofit) e bancos de dados locais (SharedPreferences ou Hive).

## 3. Domain (Domínio do App)

  Aqui fica a lógica de negócio, separada da camada de dados e da interface do usuário.

- **entities/**

  Contém entidades mais abstratas, que representam o domínio do app, sem dependências de bibliotecas externas.

- **usecases/**

  Cada caso de uso é uma ação específica que o app permite.

## 4. Presentation (Interface de Usuário)

  Esta pasta contém tudo relacionado à UI (telas e widgets).

- **pages/**

  Contém as páginas do app, organizadas por recursos.

- **widgets/**

  Contém widgets reutilizáveis, como botões personalizados, campos de texto ou componentes de layout.

- **stores/**

  Contém os stores MobX, que gerenciam o estado das páginas.


# 📦 Como Rodar o Projeto

Pré-requisitos

- Flutter SDK instalado
- Android Studio, Visual Studio Code ou qualquer outro editor compatível com Flutter
- Emulador Android/iOS configurado ou dispositivo físico conectado

# Passos
1. Clone este repositório:
```
git clone https://github.com/joaoygo/loomi_player.git

cd loomi_player
```

2. Instale as dependências:
```
flutter pub get
```
3. Execute o aplicativo:
```
flutter run
```