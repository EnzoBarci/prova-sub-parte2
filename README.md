# Prova Substitutiva - Parte 2 - Jogo da Velha em Solidity
## Introdução:

## Regras de Negócio:

- O jogo tem que ser permitido para que apenas 2 jogadores possam jogar. Mas que também não possa ter apenas 1 jogador jogando.

- O jogo tem que haver uma alternância de turnos entre os 2 jogadores.

- No código tem que haver uma validação de jogadas (posição ocupada, fora da vez).

- No código tem que haver uma verificação de condições de vitória ou empate dentro do jogo.

- O código tem que possuir um controle de acesso onde apenas os jogadores registrados podem jogar e apenas o dono do contrato pode resetar o jogo.


## 4. Testes no Remix IDE
**Para garantir que a compilação ocorra corretamente faça:**

- Abra o Remix IDE.

- Crie um novo arquivo e copie o código "jogoDaVelha.sol" dentro da pasta "smart contract"

- Selecione a versão do compilador que está no código

**Fazendo agora a implantação:**

- Escolha o contrato "JogoDaVelha" e clique em "Deploy".

- Após a implantação, utilize a função iniciarPartida() (chamada pelo dono do contrato) para registrar dois endereços que representarão os jogadores.

<div align="center">
<sub>Figura 1 - Deploy</sub>
<img src="assets\deploy.png" width="100%" >
</div>


**Realização de Jogadas:**

- Execute a função jogar(linha, coluna) de forma alternada com os endereços registrados.

- Verifique os eventos emitidos e o estado do tabuleiro usando getTabuleiro().

- Verificação de Vitória ou Empate:

<div align="center">
<sub>Figura 2 - Adiciona Jogadores</sub>
<img src="assets\adiciona-jogador.png" width="100%" >
</div>

<div align="center">
<sub>Figura 3 - Realização de jogadas</sub>
<img src="assets\realiza-jogadas.png" width="100%" >
</div>

**Verificar o estado do jogo:**

- Utiliza a função estadoJogo para ver se alguém ganhou ou se teve empate no jogo. 0 = em andamento, 1 = jogador 1 ganhou, 2 = jogador 2 ganhou e 3 = empate.

<div align="center">
<sub>Figura 3 - Realização de jogadas</sub>
<img src="assets\estado.png" width="100%" >
</div>

**Reiniciar o Jogo:**

- Utilize a função reiniciarJogo() (apenas com o dono) e veja que o jogo foi reiniciado

<div align="center">
<sub>Figura 5 - Reiniciar jogo</sub>
<img src="assets\reiniciar.png" width="100%" >
</div>

**Testes de autenticidade do dono do contrato**

- Tentar fazer ações onde apenas o endereço do dono do contrato pode fazer.

<div align="center">
<sub>Figura 5 - Reiniciar jogo</sub>
<img src="assets\teste.png" width="100%" >
</div>


## 5. Conclusão
- Este código atende todas as regras que foram propostas na atividade. Podendo ser testadas e validadas pelas funções do contrato.

- O controle de acesse faz com que jogadas que não são permitidas não vão ocorrer, protegendo a integridade do jogo.

- Além de que o código faz o que é pedido na criação de um jogo da velha em solidity.
