# PokemonTCGInfo

PokemonTCGInfo é um aplicativo iOS desenvolvido em SwiftUI que consome a API do **Pokémon TCG** para exibir informações sobre cartas do jogo de cartas colecionáveis de Pokémon. O projeto segue a arquitetura MVVM e utiliza **Combine** para manipulação de dados assíncronos.

## Recursos

- Listagem de cartas Pokémon.
- Busca de cartas por nome.
- Paginação para carregar mais cartas.
- Visualização detalhada de cada carta com informações como ataques, fraquezas e resistências.
- Link para compra das cartas via TCGPlayer.

## Tecnologias Utilizadas

- **SwiftUI** - Para construção da interface.
- **Combine** - Para reatividade e manipulação de assinaturas.
- **MVVM** - Para separação de responsabilidades e melhor manutenção do código.
- **URLSession e Alamofire** - Para requisições HTTP.

## Instalação

1. Clone este repositório:
   ```sh
   git clone https://github.com/felipesantos17/PokemonTCGInfo.git
   ```
2. Abra o projeto no **Xcode**.
3. Rode o aplicativo no simulador ou em um dispositivo físico.

## Como Usar

1. A tela inicial exibe uma lista de cartas Pokémon.
2. Utilize o campo de busca para encontrar uma carta específica pelo nome.
3. Role até o final para carregar mais cartas automaticamente.
4. Clique em uma carta para ver mais detalhes, incluindo ataques, fraquezas e resistências.

## API Utilizada

O projeto consome a API oficial do **Pokémon TCG**: [https://pokemontcg.io](https://pokemontcg.io)

## Contribuição

Contribuições são bem-vindas! Para contribuir:

1. Fork o repositório.
2. Crie uma branch para sua feature:
   ```sh
   git checkout -b minha-feature
   ```
3. Commit suas mudanças:
   ```sh
   git commit -m "Adicionando nova feature"
   ```
4. Envie para o repositório remoto:
   ```sh
   git push origin minha-feature
   ```
5. Abra um Pull Request.

## Licença

Este projeto é licenciado sob a **MIT License**.

---

Criado por [Felipe Santos](https://github.com/felipesantos17).

