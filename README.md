## DigioTest

![DigioTest](https://github.com/vitormeds/DigioTest/assets/12155092/40dd90ce-1b2a-4dd0-93af-b52d7ebc2e0a)

## Arquitetura

A arquitetura utilizada no projeto foi definida como MVVM-C. Segue esquema das camadas da arquitetura, sendo elas Model, ViewModel, View e Coordinator:

![Diagrama sem nome drawio](https://github.com/vitormeds/DigioTest/assets/12155092/1ba466ec-675a-4d17-bdf1-193e1117531f)


**Model**: Representa os dados do aplicativos.

**ViewModel**:  Atua como um intermediário entre a visualização e o modelo de dados, recupera dados do modelo de dados e os transforma em um formato que pode ser facilmente exibido pela exibição.

**View**: Camada de exibição exibe a interface do usuário do aplicativo e se comunica com o modelo de exibição para atualizar a interface.

**Coordinator**: Responsável por lidar com o fluxo de navegação do aplicativo.

A comunicação entre as camadas e feita através de protocolos.

## Bibliotecas

**Alamofire**

Biblioteca escolhida para lidar com as chamadas para a API Rest.

**Nuke**

Responsável por realizar o cache das imagens

**Lottie**

Utilizada em algumas animações do App.

**SwiftLint**

Responsável por fazer a verificação da qualidade da escrita do código

**SwiftGen**

Gera classes para facilitar o acesso a Strings localizadas e Assets do projeto

**iOSSnapshotTestCase**

Biblioteca para implementar os testes de Snapshot

## Observações

Para executar os testes de Snapshot utilize o emulador do iPhone 14 Pro Max e iOS 16.4, que e o modelo usado para gerar as imagens de referencia





