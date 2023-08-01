# DigioTest

Arquitetura

A arquitetura utilizada no projeto foi definida como MVVM-C. Segue esquema das camadas da arquitetura, sendo elas Model, ViewModel, View e Coordinator:

![Diagrama sem nome](https://github.com/vitormeds/DigioTest/assets/12155092/8c78a44c-49bb-413b-ac3c-6fff439e2ce8)

Model: Representa os dados do aplicativos.
ViewModel:  Atua como um intermediário entre a visualização e o modelo de dados, recupera dados do modelo de dados e os transforma em um formato que pode ser facilmente exibido pela exibição.
View: Camada de exibição exibe a interface do usuário do aplicativo e se comunica com o modelo de exibição para atualizar a interface.
Coordinator: Responsavel por lidar com o fluxo de navegação do aplicativo.

A comunicação entre as camadas e feita atraves de protocolos.

Bibliotecas

Alamofire
Biblioteca escolhida para lidar com as chamadas para a API Rest.

Nuke
Responsavel por realizar o cache das imagens

Lottie
Utilizada em algumas animações do App.

SwiftLint
Responsavel por fazer a verificaçao da qualidade da escrita do codigo

SwiftGen
Gera classes para facilitar o acesso a Strings localizadas e Assets do projeto






