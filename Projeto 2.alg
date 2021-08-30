Algoritmo "busao 1"
// Disciplina   : LABORATÓRIO ALGORITMOS E PROGRAMAÇÃO I
// Professor   : Douglas
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Gabriel Leiria , Daiane Paula, Michael Victor
// Data atual  : 18/08/2021
Var
mat_inicial:vetor[1..3,1..3] de inteiro

mat_atual:vetor[1..3,1..3] de inteiro

comparar_:vetor[1..3,1..3] de inteiro

codigo:vetor[1..3,1..3] de inteiro

caracter_:vetor[1..3,1..3] de caracter

max_item:inteiro

i,j:inteiro

codigo_var:inteiro  // variavel global (codigo)

cpf:vetor[1..3,1..3] de inteiro
nome:vetor[1..3,1..3] de caracter
idade:vetor[1..3,1..3] de inteiro
destino:vetor[1..3,1..3] de caracter

ip:inteiro //variaveis para selecionar as matrizes
jp:inteiro

contador:inteiro // conta quantas vagas tem disponivel no onibus
//menu---
reset:logico  //variavel para resetar
opcao:inteiro //opções do menu
lp:caracter // variavel  para apertar enter e freiar o loop

passagem:real
//----------------------------------------------------------------
procedimento mostrar_cad //foram criado dois procedimentos de
//mostrar na tela um para ser iserido dentro de outro procedimento
//(cadastro) na linha 137 e outro  para o procedimento
//(mostrar_vaga) disponivel na linha 401 que vai ser solicitado
//no menu
inicio
para i de 1 ate 3 faca
  para j de 1 ate 3 faca
  se mat_atual[i,j] = 0 entao     //mostrar matriz na tela
  caracter_[i,j]<-"Vaga  |"     // se = 0 tem vaga
  senao
  caracter_[i,j]<-"Ocupado "    //se diferente de 0 ta ocupado
  fimse
  fimpara
  fimpara


   para i de 1 ate 3 faca
      para j de 1 ate 3 faca//mostrar matriz na tela linha coluna

      escreva (" L",i," , ","C",j," ")

      escreva (caracter_[i,j]:8)//vetor caracter p/mostrar na tela
      fimpara
      escreval()
      escreval("|----------------|------------------|------------------|")
   fimpara
   escreval()
fimprocedimento
//--------------------------------------------------------
procedimento mostrar_vaga
var
enter:logico
Inicio

//--------------------------------------------------------
//validando se tem vaga ou nao no vetor

  para i de 1 ate 3 faca
  para j de 1 ate 3 faca
  se mat_atual[i,j] = 0 entao
  caracter_[i,j]<-"Vaga  |"
  senao
  caracter_[i,j]<-"Ocupado "
  fimse
  fimpara
  fimpara


   para i de 1 ate 3 faca
      para j de 1 ate 3 faca

      escreva (" L",i," , ","C",j," ")

      escreva (caracter_[i,j]:8)
      fimpara
      escreval()
      escreval("|----------------|------------------|------------------|")
   fimpara
   escreval()
   
  se contador >= 9 entao   // se o onibus estiver lotado
escreval()
 escreval ("-------------------------")
 escreval ("Busão lotou volte amanhã")
 escreval ("-------------------------")
 fimse
 escreval("Aperte enter para voltar")
 leia(lp)

 limpatela // limpando a tela para voltar ao menu
//----------------mostrar na tela as vagas ^
fimprocedimento

 
//--------------------------------------------------------
procedimento cadastro
var
resett:logico
carteira:real
troco:real
respostaa:caracter
lpi:inteiro


inicio

  passagem<-230.10  //fixando o valor em 230.10 reais

  resett<- verdadeiro
  enquanto resett faca

   mostrar_cad // chamando o procedimento para mostrar na tela as vagas p/ cadastro


  escreval ("Digite o primeiro valor referente a Linha que deseja reservar ")
  leia (ip) //variavel para pesquisar dentro da matriz linha
  escreval()
  escreval ("Digite o segundo valor referente a coluna que deseja reservar ")
  leia (jp) //variavel para pesquisar dentro da matriz coluna

// se for 0 é porque tem vaga


     se (ip < 0) ou (ip > 3) ou  (jp < 0) ou (jp > 3) entao
       limpatela
      escreval()
      escreval ("------------------------")
      escreval ("Erro numero invalido !!!")
      escreval ("------------------------")
      resett<-verdadeiro
      senao
      resett<-falso
      fimse
     fimenquanto

se mat_atual[ip,jp] = 0 entao // se matriz = 0 tem vaga

      limpatela // limpando o reset
      escreval ("Bem vindo a reserva")
      escreval ("--------------------")
      escreval ("Insira seu CPF Máx 9 digitos")
      leia (cpf[ip,jp]) //vai gravar o vetor cpf

      //matriz atual recebe o cpf digitado
      mat_atual[ip,jp]<- cpf[ip,jp]
      
     escreval ("Insira seu nome")
     leia (nome[ip,jp])    //vai gravar o vetor nome
     escreval ("Insira sua idade")
     leia (idade[ip,jp])  //vai gravar o vetor idade
     escreval ("Insira seu Destino")
     leia (destino[ip,jp]) //vai gravar o vetor destino

  // atribuindo o cpf da pessoa no banco do onibus
   mat_inicial[ip,jp]<-(cpf[ip,jp])

   escreval()
   escreval ("Usuário cadastrado !")
   contador<- contador + 1
   escreval()

      lpi<-0
//estrutura de repetição repita --------------------------------
 repita

   escreval ("---------")
   escreval ("- Caixa -")
   escreval ("---------")
   escreval()
   escreval ("A viagem para [ ",destino[ip,jp] ," ] Custa :",passagem:3:2)
   escreval()
 //validar se a pessoa quer desistir
   escreval ("Confirma o Pagamento ? (S/N)")

       leia (respostaa)
       limpatela
    se (respostaa= "s") ou (respostaa="S") entao
    escreval()
    escreval ("--------------------------------------")
    escreval ("Obrigado, ",nome[ip,jp]," tenha uma boa viagem")
    escreval ("--------------------------------------")
    lpi <- lpi +1
       senao
    // se sim vai perguntar se quer cancelar seu cadastro
       escreval ("Deseja cancelar seu cadastro ? (S/N) ")
       
       leia (respostaa)
       limpatela
       se (respostaa= "s") ou (respostaa="S") entao
            limpatela
            escreval ()
            escreval ("Cadastro cancelado por falta de pagamento!")
            lpi<-lpi+1
            mat_atual[ip,jp]<-0
            nome[ip,jp]<-""
            idade[ip,jp]<-0
            destino[ip,jp]<-""
            cpf[ip,jp]<-0
            mat_inicial[ip,jp]<-0
            contador<- contador - 1
         senao
         escreval ()
         fimse
       fimse
ate (lpi=1)
             //se contador for + ou = 9 vai dar essa mensagem
     se contador >= 9 entao
     escreval ("----------------------------------------")
     escreval ("- Apartir de Agora o Busão está lotado -")
     escreval ("----------------------------------------")
     fimse
     escreval ()


senao // se matriz <> 0 a vaga está ocupada linha 156
escreval ("---------------------------------")
escreval (" - Vaga ocupada tente novamente -")
escreval ("---------------------------------")

fimse

escreval()
 

escreval ("Pressione enter para voltar")
leia(lp)
limpatela
escreval()
 
fimprocedimento


procedimento buscacpf
var
pesq_cpf:inteiro
inicio
 escreval ("Insira o cpf para busca")
 leia (pesq_cpf)

 escreval ()
 
 para i de 1 ate 3 faca
 para j de 1 ate 3 faca
//se pesquisa cpf foi igual alguma matriz ele vai printar na tela
//o ;cpf ;nome ;idade; destino;
 se (pesq_cpf) =(cpf[i,j]) entao

escreval()
escreval ("-------------------------")
escreval ("Cpf : --------",cpf[i,j])
escreval ("Nome: --------",nome[i,j])
escreval ("Idade: -------",idade[i,j])
escreval ("Destino: -----",destino[i,j])
escreval ("-------------------------")
escreval()
  fimse
 fimpara
 fimpara


escreval()
escreval ("pressione enter para voltar")
leia(lp)
limpatela
escreval()

fimprocedimento
//--------------------------------------------------------------
procedimento cancelar
var
cpf_cancel:inteiro
resposta:caracter
inicio
      escreval ("-----------------------------")
      escreval ("- Bem vindo ao Cancelamento -")
      escreval ("-----------------------------")
      escreval ()
      escreval ("Insira o CPF cadastrado")
      leia (cpf_cancel)

      para i de 1 ate 3 faca
      para j de 1 ate 3 faca

   se mat_atual[i,j] = (cpf_cancel) entao
                             //vetores recebendo atribuiçao

        escreval ("-------------------------")
        escreval ("Cpf : --------",cpf[i,j])
        escreval ("Nome: --------",nome[i,j])
        escreval ("Idade: -------",idade[i,j])
        escreval ("Destino: -----",destino[i,j])
        escreval ("-------------------------")
        escreval()
        
        escreval ()
        
        escreval ("Certeza que deseja Cancelar ? S/N")
        leia (resposta)
        
        se (resposta = "S") ou (resposta = "s") entao //


            mat_atual[i,j]<-0
            nome[i,j]<-""
            idade[i,j]<-0
            destino[i,j]<-""
            cpf[i,j]<-0
            mat_inicial[i,j]<-0
            escreval()
            escreval ("Usuário excluído e Passagem Cancelada !")
            escreval()
            contador<-contador - 1
            escreval()
        fimse //fimse da resposta se deseja excluir
   fimse
      fimpara
      fimpara



      escreval ("Aperte enter para voltar")
      leia (lp)
 limpatela
fimprocedimento
//--------------------------------------------------------------

inicio
   reset<- verdadeiro
   enquanto reset faca
      escreval("Bem vindo ao Busuzao")
      escreval ("Selecione uma opçao")
      escreval()
      escreval("1 - Reserva")
      escreval("2 - Mostrar lugares")
      escreval("3 - Busca por cpf ")
      escreval("4 - Cancelar passagem ")
      escreval("5 - Sair")
      escreval()
      leia (opcao)
      limpatela

      escolha (opcao)
      caso 1
         limpatela  // conta se o onibus está lotado
         se contador >= 9 entao
         escreval ("-------------------------")
         escreval ("Busao lotou bb")
         escreval ("-------------------------")
         escreval()
         escreval ("-------------------------")
         escreval ("aperte enter para voltar ")
         escreval ("-------------------------")
         leia (lp)
         limpatela

         senao
         cadastro
         fimse
      caso 2
         limpatela
         mostrar_vaga
      caso 3
         limpatela
         buscacpf
      caso 4
         limpatela
         Cancelar
      caso 5
         escreval ("-------------------------------")
         escreval ("- Tenham todos uma boa Viagem -")
         escreval ("-------------------------------")
         reset<-falso

      fimescolha
   fimenquanto

fimalgoritmo