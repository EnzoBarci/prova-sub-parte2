// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Criação do contrato do jogo da velha
contract JogoDaVelha {
    
    // Variáveis de estado que vão ter no contrato
    address public dono;         
    address public jogador1;     // Jogador que vai utilizar o 'X' no jogo
    address public jogador2;     // Jogador que vai utilizar o 'O' no jogo
    
    // Representação do tabuleiro 
    uint8[3][3] public tabuleiro;  
    
    // Variável que indica o turno de cada jogaodor, se for true é do jogador 1, se for false é do jogador 2
    bool public turnoJogador1;
    
    // Representação do estado do jogo
    uint8 public estadoJogo;
    
    // Eventos para registro de jogadas e status final
    event Jogada(address jogador, uint8 linha, uint8 coluna, uint8 simbolo);
    event FimDeJogo(uint8 resultado);  // 1: jogador1 venceu, 2: jogador2 venceu, 3: empate

    // Verificador para ver se a função está chamando somente os jogadores que estão participando.
    modifier somenteJogadores() {
        require(msg.sender == jogador1 || msg.sender == jogador2, "Somente jogadores participando da partida podem jogar.");
        _;
    }
    
    // Funções acessivieis para apenas quem é dona do contrato
    modifier somenteDono() {
        require(msg.sender == dono, "Apenas o dono do contrato pode executar esta operacao.");
        _;
    }
    
    // Define o dono do contrato.
    constructor() {
        dono = msg.sender;
        estadoJogo = 0; // Jogo em andamento
    }
    
    // Função que inicia a partida, registrando os dois jogadores.
    // jogador 1 sendo o 'X'
    // jogador 2 sendo o 'O'
    function iniciarPartida(address _jogador1, address _jogador2) public somenteDono {
        require(_jogador1 != address(0) && _jogador2 != address(0), "Enderecos validos sao obrigatorios.");
        jogador1 = _jogador1;
        jogador2 = _jogador2;
        turnoJogador1 = true;
        estadoJogo = 0;
        // Reinicia o tabuleiro, para que fique todas as posições vazias.
        for(uint8 i = 0; i < 3; i++) {
            for(uint8 j = 0; j < 3; j++) {
                tabuleiro[i][j] = 0;
            }
        }
    }
    
    // Função que faz uma jogada no tabuleiro
    // Linha do tabuleiro definida por 0, 1 ou 2
    // Coluna do tabuleiro por 0, 1 ou 2
    function jogar(uint8 linha, uint8 coluna) public somenteJogadores {
        require(estadoJogo == 0, "Jogo encerrado. Reinicie para jogar novamente.");
        require(linha < 3 && coluna < 3, "Posicao fora do tabuleiro.");
        require(tabuleiro[linha][coluna] == 0, "Posicao ja ocupada.");
        
        uint8 simbolo;
        // Faz a verificação para ve se é a vez do jogador correto.
        if (turnoJogador1) {
            require(msg.sender == jogador1, "Nao e sua vez de jogar.");
            simbolo = 1; 
        } else {
            require(msg.sender == jogador2, "Nao e sua vez de jogar.");
            simbolo = 2; 
        }
        
        // Marca a jogada feita por cada jogador
        tabuleiro[linha][coluna] = simbolo;
        emit Jogada(msg.sender, linha, coluna, simbolo);
        
        // Faz a verificação para ver se houve um vencedor ou se foi empate.
        if(verificarVitoria(simbolo)) {
            estadoJogo = simbolo; // 1 ou 2 indicando qual jogador venceu
            emit FimDeJogo(simbolo);
        } else if(verificarEmpate()) {
            estadoJogo = 3; // indicando que houve um empate no jogo
            emit FimDeJogo(3);
        } else {
            // Alterna o turno de cada jogador
            turnoJogador1 = !turnoJogador1;
        }
    }
    
    // Função interna para verificar se o jogador com 'simbolo' ganhou o jogo.
   
    function verificarVitoria(uint8 simbolo) internal view returns (bool) {
        // Faz a verifiação das linhas e colunas
        for (uint8 i = 0; i < 3; i++) {
            if (tabuleiro[i][0] == simbolo && tabuleiro[i][1] == simbolo && tabuleiro[i][2] == simbolo) {
                return true;
            }
            if (tabuleiro[0][i] == simbolo && tabuleiro[1][i] == simbolo && tabuleiro[2][i] == simbolo) {
                return true;
            }
        }
        // Faz a verificação das diagonais do jogo
        if (tabuleiro[0][0] == simbolo && tabuleiro[1][1] == simbolo && tabuleiro[2][2] == simbolo) {
            return true;
        }
        if (tabuleiro[0][2] == simbolo && tabuleiro[1][1] == simbolo && tabuleiro[2][0] == simbolo) {
            return true;
        }
        
        return false;
    }
    
    // Função interna para verificar se o jogo terminou em empate.
    // true se todas as posições estiverem preenchidas e nenhum vencedor.
    function verificarEmpate() internal view returns (bool) {
        for(uint8 i = 0; i < 3; i++) {
            for(uint8 j = 0; j < 3; j++) {
                if(tabuleiro[i][j] == 0) {
                    return false;
                }
            }
        }
        return true;
    }
    
    // Permite reiniciar o jogo caso tenha terminado (por empate ou vitória).
    // Só o dono do contrato pode chamar esssa função
    function reiniciarJogo() public somenteDono {
        estadoJogo = 0;
        turnoJogador1 = true;
        // Reinicia o jogo
        for(uint8 i = 0; i < 3; i++) {
            for(uint8 j = 0; j < 3; j++) {
                tabuleiro[i][j] = 0;
            }
        }
    }
    
    // Faz um get para obter o estado atual do tabuleiro.
    function getTabuleiro() public view returns (uint8[3][3] memory) {
        return tabuleiro;
    }
}
