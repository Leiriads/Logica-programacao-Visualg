Algoritmo "Controle de Estoque  Vendas "
// Disciplina  : LABORATÓRIO ALGORITMOS E PROGRAMAÇÃO I
// Professor   : Douglas Ferrari
// Descrição   : Controle de Estoque / Vendas
// Autor(a)    : Gabriel Leiria
// Data atual  : 28/07/2021

// Este programa faz um controle de estoque de 5 produtos

//Uma empresa solicitou o desenvolvimento de um sistema, na qual
// passou alguns requisitos básicos, identificados pelo analista
//  de requisitos, e estes foram estruturados e passados para a
// equipe de desenvolvimento. A feature consiste em elaborar um
// controle de estoque em tempo de execução.

// REQUISITOS:

// - Cadastrar produto, alterar produto, excluir produto, consultar produto. Vender produto, consultar estoque.
// - Produtor deve conter: descrição, nome e quantidade e código.
// - Criar critério após encerrar programa apresentar se algum produto precisa ser comprado para repor estoque, considerar estoque baixo, 30% da quantidade cadastrada.
// - Elaborar os menus recursivos na qual você pode avançar e voltar nos menu.
// - Comentar código usando para cada estrutura para facilitar os próximos desenvolvedores a entender seu algoritmo e continuar o desenvolvimento (boas praticas de programação).


// OBS:
// 1- UTILIZAR OS RECURSOS APLICADOS NA UNIDADE CURRICULAR.
// 2- NÃO SERÁ NECESSÁRIO CRIAR BANCO DE DADOS.
// 3 - SALVAR EM ARQUIVO (TXT,DOC, PDF OU DOCX).
// 4- EM CASO DO ALGORITMO NÃO ESTIVER FUNCIONANDO OU 100% CONSTRUÍDO, SERÁ AVALIADO A LÓGICA IMPLEMENTADA.
// 5- O TEMA DA LOJA FICA A CRITÉRIO DA EQUIPE (EXEMPLO AUTO PEÇAS, PRODUTOS AGRO, FARMÁCIA, ETC).


Var
   bebida:Vetor[1..5] de Caracter
   descricao:Vetor[1..5] de Caracter
   preco:Vetor[1..5] de real
   codigo:Vetor[1..5] de inteiro
   estoqueinicial:Vetor[1..5] de inteiro
   estoqueatual:Vetor[1..5] de inteiro
   pestoqueEmreais:vetor[1..5]de real

   maximoitem:inteiro

   armazencont:inteiro

   reset:logico //loop
   lp:logico

   opcao:caracter

   item:inteiro
   QPC:inteiro //quantidade para cadastro
   codigopa:inteiro // codigo para alterar



   // vetores usados para comparar os 30 %
   QPVVET:vetor[1..5] de inteiro
   Qpv:inteiro

   vetestoquebaixo:vetor [1..5] de real



funcao funcpesquisa(cod : inteiro): inteiro
Var
   Itemf , conteudo: inteiro
Inicio
   conteudo <- 0
   para itemf de 1 ate maximoitem faca  // vai ler todos os elementos
      se (cod = Codigo[itemf]) entao // se achar , volta o elemento
         conteudo <- itemf
      fimse
   fimpara
   retorne conteudo   // retorna o conteúdo
fimfuncao


procedimento cadastro
var
   preset:logico
   pbebida:caracter
   pdescricao:caracter  //bloco de variavel temporaria
   ppreco:real
   pcodigo:inteiro
   pestoqueinicial:inteiro
   ppesquisa:inteiro
   resposta:caracter

inicio
   preset<-verdadeiro

      escreval(".________________________________________.")
      escreval("|                                        |")
      escreval("|  Bem vindo(a) ao Cadastro de Produtos  |")
      escreval("|________________________________________|")
      escreval(";                                        ;")
   enquanto preset faca
      item<- item +1
      se item > maximoitem entao
         preset<-falso
      senao


         escreval()
         escreval ("         Insira abaixo : ")
         escreval("                |")
         escreval("                |")
         escreval("                V")
         escreval()
         escreva ("         Código : ")
         leia (pcodigo)

         ppesquisa<-funcpesquisa(pcodigo) // vai pesquisar o código
         se ((ppesquisa = 0) e (pcodigo <> 0)) entao
            //Se for zero significa que ainda não foi cadastrado

            escreva ("         Nome : ")
            leia (pbebida)
            escreva ("         Descrição : ")
            leia (pdescricao)
            escreva ("         Preço : ")
            leia (ppreco)
            escreva ("         Quantidade (estoque): ")
            leia (pestoqueinicial)
            escreval()
            escreval("         Deseja Salvar este produto ? ( S / N )")
            leia (resposta)
            se ((resposta= "s")ou (resposta = "S"))entao
               limpatela
               armazencont<-armazencont +1

               bebida[item] <-pbebida
               descricao[item]<-pdescricao
               preco[item] <-ppreco // atribuindo variavel local no vetor
               codigo[item] <-pcodigo
               estoqueinicial[item] <-pestoqueinicial
               estoqueatual[item]<-pestoqueinicial

            senao
               se item > 0 entao
                  item <- item -1
               fimse
            fimse
         senao
            se (pcodigo =0) entao
               se item > 0 entao
                  item <- item -1
               fimse
               preset<-falso
            senao
               limpatela
               escreval ("Este codigo já existe no cadastro")
            fimse
         fimse
      fimse
      resposta<-""
      escreval()
      escreval("deseja continuar (S / N )?")
      leia (resposta)
      se ((resposta="N") ou (resposta = "n")) entao
         preset<- falso
      senao
         limpatela
         preset<-verdadeiro
      fimse
   fimenquanto
fimprocedimento




procedimento alterarproduto
var
   preset:logico              // variavel local
   pbebida:caracter
   pdescricao:caracter
   ppreco:real
   pcodigo:inteiro
   pestoqueinicial:inteiro
   pestoqueatual:inteiro
   ppesquisa:inteiro
   resposta:caracter
   apesquisa:inteiro
inicio
   preset<-verdadeiro
   enquanto preset faca
      se armazencont < 1 entao // verifica se tem algo no cadastro
         escreval(" ________________________________")
         escreval("|                                |")
         escreval("| Erro nenhum produto cadastrado |")
         escreval("|________________________________|")
         escreval()
         escreval("Aperte ( Enter ) ")
         leia(lp)
         preset<-falso
      senao
      escreval(".__________________.")
      escreval("|                  |")
      escreval("|  Alterar Produto |")
      escreval("|__________________|")
      escreval()
         escreval()
         escreval ("._______________________________________________.")
         escreval ("|                                               |")
         escreval ("| Insira o código do produto que deseja alterar |")
         escreval ("|_______________________________________________|")
         escreval ()

          para item de 1 ate armazencont faca
           se codigo[item] > 0 entao
            escreval("__________________________________________")
            escreval()
            escreval("  o Código  : ",codigo[item], "   Nome :", bebida[item])
            escreval("__________________________________________")
            escreval()
          fimse
          fimpara


         leia(pcodigo)
         limpatela
         escreval()
         escreval()





         se ((pcodigo >0) e (pcodigo > 0)) entao



            se (pcodigo=0) entao
               preset<-falso
            senao
               apesquisa<- funcpesquisa(pcodigo)// pesquisar o codigo
               se apesquisa > 0 entao // sem maior que zero significa
                  pbebida <- bebida[apesquisa]                        //que ta cadastrado
                  pdescricao <- descricao[apesquisa]
                  ppreco <- preco[apesquisa]
                  pestoqueinicial <- estoqueinicial[apesquisa]
                  pestoqueatual <- estoqueinicial[apesquisa]
                  limpatela
                  escreval ("Insira o novo Nome : ")
                  leia (pbebida)
                  escreval ("Insira a nova Descrição : ")
                  leia (pdescricao)
                  escreval ("Insira o novo Preço : ")
                  leia (ppreco)
                  escreval ("Insira a nova Quantidade (estoque): ")
                  leia (pestoqueinicial)
                  escreval()
                  escreval ("Tem certeza que deseja alterar ? (S/N)")
                  leia (resposta)
                  se (resposta = "s") ou (resposta = "S")entao
                     bebida[apesquisa]<-pbebida
                     descricao[apesquisa]<-pdescricao
                     preco[apesquisa]<-ppreco
                     estoqueinicial[apesquisa]<-pestoqueinicial
                     estoqueatual[apesquisa]<- pestoqueinicial //estoque atual recebe estoque inicial.
                  fimse
               senao    // se ainda nao foi cadastrado vai dar erro
                  escreval()
                  escreval("._______________________________.")
                  escreval("|                               |")
                  escreval("| Código não existe no Cadastro |")
                  escreval("|_______________________________|")
                  escreval(";                               ;")
                  escreval()
                  escreval()
               fimse
            fimse



                                 // volta para o menu
            resposta<-""
            escreval()
            escreval("Deseja voltar ao menu ? ( S / N ) ")
            leia (resposta)
            se (resposta = "s") ou (resposta = "S") entao
               preset <- falso
            fimse



         fimse

      fimse

   fimenquanto
fimprocedimento

procedimento excluir
var
   exreset:logico
   pbebida:caracter
   pdescricao:caracter
   ppreco:real
   pcodigo:inteiro                  // variaveis locais
   pestoqueinicial:inteiro
   pestoqueatual:inteiro
   ppesquisa:inteiro
   resposta:caracter
   expesquisa:inteiro
   pestoqueEmreais:real


inicio

   exreset<-verdadeiro
   enquanto exreset faca
      se armazencont < 1 entao // verifica se tem algo no cadastro
         escreval(".________________________________.")
         escreval("|                                |")
         escreval("| Erro nenhum produto cadastrado |")
         escreval("|________________________________|")
         escreval(";                                ;")
         escreval("Aperte ( Enter ) ")
         leia(lp)
         exreset<-falso
      senao

         limpatela
      escreval(".__________________.")
      escreval("|                  |")
      escreval("|  Excluir Produto |")
      escreval("|__________________|")
      escreval(";                  ;")

         escreval()

         //mostra na tela o nome eo código cadastrado
         para item de 1 ate armazencont faca
            escreval()
            escreval ("________________________")
            escreval ("´´´´´´´´´´´´´´´´´´´´´´´´")
            escreval ("Nome : ",bebida[item])
            escreval ("Código do Produto: ",codigo[item])
            escreval ("________________________")
            escreval ("´´´´´´´´´´´´´´´´´´´´´´´´")
         fimpara




         escreval ("Insira o [ código ] do produto que deseja alterar")
         leia (pcodigo)
         se (pcodigo = 0) entao
            exreset<- falso
         senao
            expesquisa<- funcpesquisa(pcodigo)//vai pesquisar o codigo e atribuir
            se expesquisa > 0 entao

               pbebida <- bebida[expesquisa]
               pdescricao <- descricao[expesquisa]
               ppreco <- preco[expesquisa]
               pestoqueinicial <- estoqueinicial[expesquisa]
               pestoqueatual <- estoqueatual[expesquisa]

               pestoqueEmreais<- pestoqueatual*ppreco

               escreval ("________________________")
               escreval ("´´´´´´´´´´´´´´´´´´´´´´´´")
               escreval ("Bebida : ",pbebida)
               escreval ("Descricao :",pdescricao)
               escreval ("Preço : ",ppreco)
               escreval ("Estoque inicial :",pestoqueinicial)
               escreval ("Estoque Atual :",pestoqueatual)
               escreval ("Estoque Atual em R$:",pestoqueEmreais)
               escreval ("________________________")
               escreval ("´´´´´´´´´´´´´´´´´´´´´´´´")
               escreval ()

               escreval ("Deletar ? ( S / N ): ")
               leia (resposta)
               se (resposta = "S") ou (resposta = "s") entao

                  escreval()
                  escreval("Produto Deletado!")

                  armazencont <- (armazencont -1)
                  codigo[expesquisa]<-0
                  bebida[expesquisa] <- "Produto deletado"
                  descricao[expesquisa] <- ""
                  preco[expesquisa] <- 0
                  estoqueinicial[expesquisa] <- 0
                  estoqueatual[expesquisa] <- 0

                  escreval()
                  escreval ("Bebida : ",bebida[expesquisa])
                  escreval ("Descricao :",descricao[expesquisa])
                  escreval ("Preço : ",preco[expesquisa])
                  escreval ("Estoque inicial :",estoqueinicial[expesquisa])
                  escreval ("Estoque Atual :" , estoqueatual[expesquisa])
               fimse
            senao // se ainda nao foi cadastrado
               escreval ()
               escreval ()
               escreval ()
               escreval(" _________________________________________")
               escreval("|                                         |")
               escreval("| Este Código ainda não existe no cadstro |")
               escreval("|_________________________________________|")

            fimse
         fimse
         escreval()

         resposta<-""
         escreval()
         escreval("Deseja voltar ao menu ? ( S / N ) ")
         leia (resposta)
         se (resposta = "s") ou (resposta = "S") entao
            exreset <- falso
         fimse
      fimse

   fimse

fimenquanto
fimprocedimento


procedimento armazen
var
   preset:logico
   resposta:caracter
   estoqueBaixo:real

inicio


   se armazencont < 1 entao // verifica se tem algo no cadastro

      escreval(" ________________________________")
      escreval("|                                |")
      escreval("| Erro nenhum produto cadastrado |")
      escreval("|________________________________|")
      escreval()
      escreval("Aperte ( Enter ) ")
      leia(lp)  //voltando ao menu principal


   senao
      escreval("._______________________.")
      escreval("|                       |")
      escreval("|  Produtos Cadastrados |")
      escreval("|_______________________|")
      escreval(";                       ;")
      escreval()
      escreval()
      escreval()






      para item de 1 ate armazencont faca



         pestoqueEmreais[item]<-estoqueatual[item]* preco[item]

         estoqueBaixo <-estoqueinicial[item]*0.3// 30% DO ESTOQUE INICIAL

         vetestoquebaixo[item] <-estoquebaixo

         se estoquebaixo > estoqueatual[item] entao
         escreval ("._______________________________________________________.")
         escreval ("|                                                       |")
         escreval ("|",bebida[item]," Está abaixo de 30% do Estoque inicial |")
         escreval ("|_______________________________________________________|")
         escreval (";                                                       ;")
         fimse
         se codigo[item] <> 0 entao
         escreval()
         escreval ("________________________")
         escreval ("´´´´´´´´´´´´´´´´´´´´´´´´")
         escreval ("Nome : ",bebida[item])
         escreval ("Código do Produto: ",codigo[item])
         escreval ("Descrição : ",descricao[item])
         escreval ("Preço : ",preco[item]," R$")
         escreval ("Estoque inicial ",estoqueinicial[item])
         escreval ("________________________")
         escreval ("´´´´´´´´´´´´´´´´´´´´´´´´")
         escreval ("Estoque Atual :",estoqueatual[item])
         escreval ("Estoque em R$: ",pestoqueEmreais[item])
         escreval ("________________________")
         escreval ("´´´´´´´´´´´´´´´´´´´´´´´´")
         fimse
      fimpara


      escreval()
      escreval()
      escreval("_____________________________________")
      escreval("Aperte ( Enter ) Para voltar ao menu ")
      leia(lp)
   fimse

fimprocedimento






procedimento venda
var
vreset:logico
   pbebida:caracter
   pdescricao:caracter
   ppreco:real
   vcodigo:inteiro //codigo digitado pelo usuario p/ validar no vetor
   pestoqueinicial:inteiro
   pestoqueatual:inteiro
   ppesquisa:inteiro
   resposta:caracter
   vpesquisa:inteiro
   totalapagar:real
   totalvariavel:real

   P_preco:real

   estoqueBaixo:real
inicio
   vreset <- verdadeiro
   enquanto vreset faca

      se item < 1 entao // verifica se tem algo no cadastro
         vreset<-falso
         escreval(" ________________________________")
         escreval("|                                |")
         escreval("| Erro nenhum produto cadastrado |")
         escreval("|________________________________|")
         escreval()
         escreval("Aperte ( Enter ) ")
         leia(lp)
         vreset<-falso
      senao






         limpatela
      escreval(".__________________.")
      escreval("|                  |")
      escreval("|  Vender Produto  |")
      escreval("|__________________|")
      escreval(";                  ;")

         escreval()

        se codigo[item] <> 0 entao
         para item de 1 ate armazencont faca
            escreval()
            escreval ("________________________")
            escreval ("´´´´´´´´´´´´´´´´´´´´´´´´")
            escreval ("Nome : ",bebida[item])
            escreval ("Código do Produto: ",codigo[item])
            escreval ("________________________")
            escreval ("´´´´´´´´´´´´´´´´´´´´´´´´")
         fimpara
        fimse

         escreval()
         escreval (".____________________________________________________.")
         escreval ("| Insira o [ código ] do produto que deseja Vender   |")
         escreval ("|____________________________________________________|")
         leia (vcodigo)
         se (vcodigo = 0) entao
            vreset<- falso
         senao
            vpesquisa<- funcpesquisa(vcodigo)//vai pesquisar o codigo
            se vpesquisa > 0 entao

               pbebida <- bebida[vpesquisa]                        //que ta cadastrado
               pdescricao <- descricao[vpesquisa]
               ppreco <- preco[vpesquisa]

               //colocando o preço do produto na variavel temporaria
               P_preco<- preco[vpesquisa]
               //
               pestoqueinicial <- estoqueinicial[vpesquisa]
               pestoqueatual <- estoqueatual[vpesquisa]
               //
               //estoqueatual[vpesquisa]<-estoqueatual[vpesquisa]-QPVVet[vpesquisa]
               //
               escreval ()
               escreval ("________________________")
               escreval ("´´´´´´´´´´´´´´´´´´´´´´´´")
               escreval ("Bebida : ",pbebida)
               escreval ("Descricao :",pdescricao)
               escreval ("Preço : ",ppreco)
               //escreval ("Estoque inicial :",pestoqueinicial)
               escreval ("Estoque Atual :",pestoqueatual)
               escreval ("________________________")
               escreval ("´´´´´´´´´´´´´´´´´´´´´´´´")
               escreval ()
               escreval ()
               escreval ("  _______________________")
               escreval (" | Confirma ? ( S / N ): |")

               leia (resposta)


               se (resposta = "S") ou (resposta = "s") entao
                  escreval()
                  escreval()
                  escreval(".________________________________.")
                  escreval("|                                |")
                  escreval("| Quantos produtos deseja levar? |")
                  escreval("|________________________________|")

                  leia (Qpv)
                  escreval()
                  se (Qpv>0) entao




                     QPVVET[item]<-Qpv

                     estoqueatual[vpesquisa]<-estoqueatual[vpesquisa]-QPVVET[item]

                     //atualizando estoque em reais
                     pestoqueEmreais[vpesquisa]<-estoqueatual[vpesquisa]* preco[vpesquisa]
                     //----------------------------------------
                     estoquebaixo <-estoqueinicial[vpesquisa]*0.3// 30% DO ESTOQUE INICIAL

                     vetestoquebaixo[vpesquisa] <-estoquebaixo

                     se estoquebaixo > estoqueatual[vpesquisa] entao
                     escreval (bebida[vpesquisa]," Está abaixo de 30% do Estoque inicial ")
                     fimse



                     totalapagar<-Qpv*P_preco

                     escreval()
                     escreval ("________________________")
                     escreval ("´´´´´´´´´´´´´´´´´´´´´´´´")
                     escreval ("o Total a Pagar é ",totalapagar, " R$")
                     escreval ("________________________")
                     escreval ("´´´´´´´´´´´´´´´´´´´´´´´´")
                     fimse



                fimse

            senao
               escreval ("________________________")
               escreval("|                        |")
               escreval("| Produto não cadastrado |")
               escreval("|________________________|")
            fimse
         fimse
         escreval()


         resposta<-""
         escreval()
         escreval("Deseja voltar ao menu ? ( S / N ) ")
         leia (resposta)
         se (resposta = "s") ou (resposta = "S") entao
            vreset <- falso
         fimse

      fimse
   fimse
fimse
fimenquanto
fimprocedimento




//--------------------------------------------------------------

//aqui o programa começa

//--------------------------------------------------------------


Inicio
   maximoitem<-5
   lp <- verdadeiro
   reset <- verdadeiro
   item <- 0

   enquanto reset faca    //loopando o menu
      lp <- verdadeiro
      mudacor("Amarelo","frente")
      limpatela
      escreval ("Bem vindo-(a) ao mercadinho Leiria : ")
      escreval()
      escreval (" ________________________")
      escreval ("|                        |")
      escreval ("|  1  Cadastrar produto  |")
      escreval ("|  2  Alterar produto    |")
      escreval ("|  3  Excluir produto    |")
      escreval ("|  4  Verificar produto  |")
      escreval ("|  5  Vender produto     |")
      escreval ("|  6  Sair               |")
      escreval ("|________________________|")
      escreval ()
      escreval ("   Selecione uma opção")
      leia(opcao)
      se ((opcao > "0") e (opcao < "7")) entao
         escolha (opcao)    // escolha-caso chamando os procedimentos
         caso "1"
            limpatela
            cadastro
         caso "2"
            limpatela
            alterarproduto
         caso "3"
            limpatela
            excluir
         caso "4"
            limpatela
            armazen
         caso "5"
            limpatela
            venda
         caso "6"
            reset <- falso
            limpatela
            escreval (" __________________________ ")
            escreval ("|                          |")
            escreval ("| Obrigado volte sempre :) |")
            escreval ("|__________________________|")
         outrocaso
            escreval ("erro número invalido")

         fimescolha
      senao //se digitar algo que não são as opções vai dar inválido
         escreval("Opção inválida")
         escreval("Aperte ( enter )")
         leia(lp)//usando essa variavel logica só para apertar enter
      fimse
   fimenquanto
Fimalgoritmo