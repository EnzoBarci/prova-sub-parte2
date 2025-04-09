# Prova Substitutiva - Parte 2 - Jogo da Velha em Solidity
## 1. Introdução:

**Atividade de desenvolvimento de um smart contract em Solidity para a implementação do jogo da velha, seguindo as boas práticas de desenvolvimento e controle de versão para garantir um jogo com regras transparentes e verificáveis.**

## 2. Regras de Negócio:

- O jogo tem que ser permitido para que apenas 2 jogadores possam jogar. Mas que também não possa ter apenas 1 jogador jogando.

- O jogo tem que haver uma alternância de turnos entre os 2 jogadores.

- No código tem que haver uma validação de jogadas (posição ocupada, fora da vez).

- No código tem que haver uma verificação de condições de vitória ou empate dentro do jogo.

- O código tem que possuir um controle de acesso onde apenas os jogadores registrados podem jogar e apenas o dono do contrato pode resetar o jogo.


## 3. Testes no Remix IDE

**3.1 Para garantir que a compilação ocorra corretamente faça:**

- Abra o Remix IDE.

- Crie um novo arquivo e copie o código "jogoDaVelha.sol" dentro da pasta "smart contract"

- Selecione a versão do compilador 0.8.26 que está no código

<div align="center">
<sub>Figura 1 - Deploy</sub>
<img src="assets\remix.png" width="100%" >
</div>

**3.2 Implantação:**

- Escolha o contrato "JogoDaVelha" e clique em "Deploy".

- Após a implantação, utilize a função iniciarPartida() (chamada pelo dono do contrato) para registrar dois endereços que representarão os jogadores.

<div align="center">
<sub>Figura 1 - Deploy</sub>
<img src="assets\deploy.png" width="100%" >
</div>

<div align="center">
<sub>Figura 2 - Adiciona Jogadores</sub>
<img src="assets\adiciona-jogador.png" width="100%" >
</div>

**3.3 Realização de Jogadas:**

- Execute a função jogar(linha, coluna) de forma alternada com os endereços registrados.

- Verifique os eventos emitidos e o estado do tabuleiro usando getTabuleiro().

<div align="center">
<sub>Figura 3 - Realização de jogadas</sub>
<img src="assets\realiza-jogadas.png" width="100%" >
</div>

**3.4 Verificar o estado do jogo:**

- Utiliza a função estadoJogo para ver se alguém ganhou ou se teve empate no jogo. 0 = em andamento, 1 = jogador 1 ganhou, 2 = jogador 2 ganhou e 3 = empate.

<div align="center">
<sub>Figura 4 - Estado do jogo</sub>
<img src="assets\estado.png" width="100%" >
</div>

**3.5 Reiniciar o Jogo:**

- Utilize a função reiniciarJogo() (apenas com o dono) e veja que o jogo foi reiniciado

<div align="center">
<sub>Figura 5 - Reiniciar jogo</sub>
<img src="assets\reiniciar.png" width="100%" >
</div>

**3.6 Testes de autenticidade do dono do contrato**

- Teste com um endereço de um usuário secundário, tentando fazer uma ação onde apenas o dono do contrato pode fazer.

<div align="center">
<sub>Figura 5 - Reiniciar jogo</sub>
<img src="assets\teste.png" width="100%" >
</div>


## 4. Conclusão
- Este código atende todas as regras que foram propostas na atividade. Podendo ser testadas e validadas pelas funções do contrato.

- Além de que o código faz o que é pedido na criação de um jogo da velha em solidity.
