# 🏩 Guia Moteis

Este projeto é uma réplica da tela do app **Guia de Móteis**, desenvolvido utilizando o Flutter. O foco está em apresentar uma lista de motéis com seus respectivos preços, imagens e detalhes, garantindo uma interface intuitiva e fiel ao conceito original. 🚀

## 🎯 Funcionalidades

- **Listagem de Motéis**: Exibe nome, preço e imagem dos motéis disponíveis 🏨.
- **Design Moderno**: Fidelidade visual de 80% ao app original, mantendo uma interface agradável e otimizada 🎨.
- **Avaliação de Hotéis**: A funcionalidade de avaliação está disponível no cabeçalho dos detalhes dos motéis ⭐.
- **Testes Unitários**: Cobertura de toda a lógica da aplicação, garantindo estabilidade e confiabilidade 🔧.

## 🛠 Requisitos Técnicos

- **Dart e Flutter**: Projeto modularizado e estruturado em MVVM 🛠️.
- **Consumo de API**: Utiliza o pacote `http` para buscar dados de uma API externa 🌐.
- **Gerenciamento de Estado**: Gerenciado via **Riverpod**, garantindo eficiência e controle da interface 🧠.
- **Testes Unitários**: Implementados para assegurar o correto funcionamento da lógica de listagem e filtros 🧪.


## 📐 Arquitetura

Este projeto foi desenvolvido seguindo a arquitetura **MVVM (Model-View-ViewModel)**, garantindo uma separação clara de responsabilidades:

- **View**: Responsável pela camada de apresentação, widgets e interações do usuário.
- **ViewModel**: Contém a lógica de negócios, interage com a camada de dados e transforma os dados para a interface.
- **Model**: Gerencia os dados, suas estruturas e a comunicação com fontes externas (APIs).


## Estrutura do Projeto 📂

```
GUIA_MOTEIS/
├── 📁 assets               # 🖼️ Contém recursos estáticos como imagens, ícones, etc.
├── 📁 lib                  # 💻 Código-fonte principal do aplicativo
│   ├── 📁 app              # ⚙️ Configurações e inicialização do aplicativo
│   ├── 📁 core             # 🎯 Funcionalidades centrais e constantes do aplicativo
│   ├── 📁 data             # 🗃️ Camada de dados, incluindo modelos e repositórios
│   ├── 📁 viewmodels       # 🧠 Lógica de negócios e gerenciamento de estado
│   ├── 📁 views          # 🖌️ Interface do usuário e widgets
│   ├── 📄 main.dart        # 🚀 Ponto de entrada do aplicativo
├── 📁 test                 # � Testes unitários e de integração
│   ├── 📁 data             # 🧪 Testes relacionados à camada de dados
│   ├── 📁 viewmodels       # 🧠 Testes relacionados à lógica de negócios
│   ├── 📁 mocks          # 🎭 Dados simulados para testes
```

## Pacotes do Projeto 📦

| **Pacote**         | **Versão** | **Descrição**                                      |
| ------------------ | ---------- | -------------------------------------------------- |
| `http`             | ^1.3.0     | Realiza requisições HTTP.                          |
| `google_fonts`     | ^6.2.1     | Permite o uso de fontes do Google no Flutter.      |
| `flutter_svg`      | ^2.0.17    | Renderiza arquivos SVG no Flutter.                 |
| `flutter_dash`     | ^1.0.0     | Adiciona efeitos de traço ou linha pontilhada.     |
| `logger`           | ^2.5.0     | Facilita o registro de logs no aplicativo.         |
| `flutter_riverpod` | ^2.6.1     | Gerenciamento de estado com Riverpod para Flutter. |
| `riverpod`         | ^2.6.1     | Gerenciamento de estado simples e eficiente.       |
| `carousel_slider`  | ^5.0.0     | Cria carrosséis de imagens ou widgets deslizáveis. |

# Ambiente SDK 🛠️

- **SDK**: `^3.6.1`

## 🧪 Testes

Testes unitários estão implementados para cobrir toda a lógica do app, incluindo modelos, repositórios e provedores. O foco é garantir a integridade dos dados e o comportamento esperado dos componentes. 

## 🚀 Como Rodar o Projeto

1. Clone o repositório:
   ```bash
   git clone https://github.com/raffashe/guia-moteis.git
   ```

2. Instale as dependências:
   ```bash
   flutter pub get
   ```

3. Execute o app:
   ```bash
   flutter run
   ```

4. Execute os testes:
   ```bash
   flutter test
   ```

