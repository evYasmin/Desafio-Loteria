      $set sourceformat"free"

      *>Divisão de identificação de programa
       Identification Division.
       Program-id. "Desafio.Loteria".
       Author. "Evelyn Yasmin Pereira".
       Installation. "PC".
       Date-written. 22/07/2020.
       Date-compiled. 22/07/2020.


      *>Divisão para configuração do ambiente
       Environment Division.
       Configuration section.
           special-names. decimal-point is comma.

      *>--Declaração de recursos externos (faz parte da de cima ainda)
       Input-output section.
       File-control.
       I-O-Control.


      *>Declaração de variáveis
       Data Division.

      *>--Variáveis de arquivos
       File section.

      *>--Variáveis de trabalho
       Working-storage section.

       01  ws-sorteio.
           05  ws-semente                          pic  9(08).
           05  ws-semente1                         pic  9(08).
           05  ws-num_random                       pic  9(01)v9(08).

       01  ws-numeros-sorteados.
           05  ws-sort-num1                        pic  9(02).
           05  ws-sort-num2                        pic  9(02).
           05  ws-sort-num3                        pic  9(02).
           05  ws-sort-num4                        pic  9(02).
           05  ws-sort-num5                        pic  9(02).
           05  ws-sort-num6                        pic  9(02).

       01  ws-numeros-usuario.
           05  ws-num1                             pic  9(02).
           05  ws-num2                             pic  9(02).
           05  ws-num3                             pic  9(02).
           05  ws-num4                             pic  9(02).
           05  ws-num5                             pic  9(02).
           05  ws-num6                             pic  9(02).
           05  ws-num7                             pic  9(02).
           05  ws-num8                             pic  9(02).
           05  ws-num9                             pic  9(02).
           05  ws-num10                            pic  9(02).

       01  ws-uso-comum.
           05  ws-ind-lot                          pic  9(02).
           05  ws-ind                              pic  9(02).
           05  ws-qtd-num-jog                      pic  9(02).
           05  ws-tentativa                        pic  9(02).
           05  ws-contador                         pic  9(09).

       01  ws-relogio.
           05  ws-hora                             pic  9(02).
           05  ws-minuto                           pic  9(02).
           05  ws-segundo                          pic  9(02).
           05  ws-cent_segundo                     pic  9(02).

       77  ws-diferenca-hr                         pic  9(02).
       77  ws-diferenca-min                        pic  9(02).
       77  ws-diferenca-seg                        pic  9(02).

       01  ws-hora-inicio.
           05  ws-hor                              pic 9(002).
           05  ws-min                              pic 9(002).
           05  ws-seg                              pic 9(002).

       01  ws-hora-final.
           05  ws-hor-fim                          pic  9(02).
           05  ws-min-fim                          pic  9(02).
           05  ws-seg-fim                          pic  9(02).


       Linkage section.

      *>--Declaração de tela
       Screen section.

      *>Declaração do corpo programa
       Procedure Division.

           perform inicializa.
           perform processamento.
           perform finaliza.

      *>---------------------------------------------------------------------------------
       inicializa section.

           move 0 to ws-contador
           move 0 to ws-ind-lot
            .
       inicializa-exit.
           exit.
      *>---------------------------------------------------------------------------------
      *>     Processamento
      *>---------------------------------------------------------------------------------
       processamento section.

           display "   ***************************************   "
           display "   *          FACA SUA APOSTA!!          *   "
           display "   *           E MUDE DE VIDA            *   "
           display "   *                                     *   "
           display "   *    01 02 03 04 05 06 07 08 09 10    *   "
           display "   *    11 12 13 14 15 16 17 18 19 20    *   "
           display "   *    21 22 23 24 25 26 27 28 29 30    *   "
           display "   *    31 32 33 34 35 36 37 38 39 40    *   "
           display "   *    41 42 43 44 45 46 47 48 49 50    *   "
           display "   *    51 52 53 54 55 56 57 58 59 60    *   "
           display "   *                                     *   "
           display "   ***************************************   "

           display "  "
           display "  "

           display "Informe o primeiro numero: "
           accept ws-num1
           display " "

           display "Informe o segundo numero: "
           accept ws-num2
           display " "

           display "Informe o terceiro numero: "
           accept ws-num3
           display " "

           display "Informe o quarto numero: "
           accept ws-num4
           display " "

           display "Informe o quinto numero: "
           accept ws-num5
           display " "

           display "Informe o sexto numero: "
           accept ws-num6
           display " "

           display "Informe o setimo numero: "
           accept ws-num7
           display " "

           display "Informe o oitavo numero: "
           accept ws-num8
           display " "

           display "Informe o nono numero: "
           accept ws-num9
           display " "

           display "Informe o decimo numero: "
           accept ws-num10
           display " "

           display " ---- BOA SORTE! ---- "

      *> chamar a section que realiza o sorteio
           perform sorteio

           .
       processamento-exit.
           exit.

      *>---------------------------------------------------------------------------------
      *>         Section para a realização do Sorteio
      *>---------------------------------------------------------------------------------
       sorteio section.
            move zero to ws-ind-lot

          perform until ws-ind-lot <> 0
               move ws-semente   to ws-relogio

               accept ws-semente from time
      *> gerar o primeiro número sorteado em forma randômica
              perform semente-delay
              compute ws-sort-num1 = function random(ws-semente) * 60

      *> gerar o segundo número sorteado em forma randômica
              perform semente-delay
              compute ws-sort-num2 = function random(ws-semente) * 60

      *> gerar o terceiro número sorteado em forma randômica
              perform semente-delay
              compute ws-sort-num3 = function random(ws-semente) * 60

      *> gerar o quarto número sorteado em forma randômica
              perform semente-delay
              compute ws-sort-num4 = function random(ws-semente) * 60

      *> gerar o quinto número sorteado em forma randômica
              perform semente-delay
              compute ws-sort-num5 = function random(ws-semente) * 60

      *> gerar o sexto número sorteado em forma randômica
              perform semente-delay
              compute ws-sort-num6 = function random(ws-semente) * 60

      *> chamar section que confere os números sorteados
              perform confere-num-sorteados

          end-perform
           .

       sorteio-exit.
           exit.

      *>---------------------------------------------------------------------------------
      *> Section que faz com que tenha o delay nos números que vão ser sorteados
      *>---------------------------------------------------------------------------------
       semente-delay section.
           perform 10 times
               accept ws-semente1 from time
               move ws-semente1    to ws-semente
               perform until ws-semente > ws-semente1
                   accept ws-semente from time
               end-perform
           end-perform
              .
       semente-delay-exit.

      *>---------------------------------------------------------------------------------
      *> Section que confere se os números que foram sorteados são diferente de 00 e entre eles
      *>---------------------------------------------------------------------------------
       confere-num-sorteados section.

           if   ws-sort-num1 <> ws-sort-num2
           and  ws-sort-num1 <> ws-sort-num3
           and  ws-sort-num1 <> ws-sort-num4
           and  ws-sort-num1 <> ws-sort-num5
           and  ws-sort-num1 <> ws-sort-num6
              if   ws-sort-num2 <> ws-sort-num3
              and  ws-sort-num2 <> ws-sort-num4
              and  ws-sort-num2 <> ws-sort-num5
              and  ws-sort-num2 <> ws-sort-num6
                  if   ws-sort-num3 <> ws-sort-num4
                  and  ws-sort-num3 <> ws-sort-num5
                  and  ws-sort-num3 <> ws-sort-num6
                      if   ws-sort-num4 <> ws-sort-num5
                      and  ws-sort-num4 <> ws-sort-num6
                         if   ws-sort-num5 <> ws-sort-num6
      *> chama a section para conferir os numeros apostados
                              perform confere-aposta
                              display "Numeros sorteados são: " ws-sort-num1 " - " ws-sort-num2
                               " - " ws-sort-num3 " - " ws-sort-num4 " - "
                              ws-sort-num5 " - " ws-sort-num6 " - "
                              " - " ws-contador

                         else
                              perform sorteio
                         end-if
                     end-if
                 end-if
              end-if
           end-if
                  .

       confere-num-sorteados-exit.
           exit.

      *>---------------------------------------------------------------------------------
      *> Section que confere os números sorteados são iguais o que o usuário apostou
      *>---------------------------------------------------------------------------------
       confere-aposta section.

          add 1 to ws-contador

          if   ws-sort-num1 = ws-num1 or ws-sort-num1 = ws-num2
          or   ws-sort-num1 = ws-num3 or ws-sort-num1 = ws-num4
          or   ws-sort-num1 = ws-num5 or ws-sort-num1 = ws-num6
          or   ws-sort-num1 = ws-num7 or ws-sort-num1 = ws-num8
          or   ws-sort-num1 = ws-num9 or ws-sort-num1 = ws-num10 then
               if   ws-sort-num2 = ws-num1 or ws-sort-num2 = ws-num2
               or   ws-sort-num2 = ws-num3 or ws-sort-num2 = ws-num4
               or   ws-sort-num2 = ws-num5 or ws-sort-num2 = ws-num6
               or   ws-sort-num2 = ws-num7 or ws-sort-num2 = ws-num8
               or   ws-sort-num2 = ws-num9 or ws-sort-num2 = ws-num10 then
                   if   ws-sort-num3 = ws-num1 or ws-sort-num3 = ws-num2
                   or   ws-sort-num3 = ws-num3 or ws-sort-num3 = ws-num4
                   or   ws-sort-num3 = ws-num5 or ws-sort-num3 = ws-num6
                   or   ws-sort-num3 = ws-num7 or ws-sort-num3 = ws-num8
                   or   ws-sort-num3 = ws-num9 or ws-sort-num3 = ws-num10 then
                        if   ws-sort-num4 = ws-num1 or ws-sort-num4 = ws-num2
                        or   ws-sort-num4 = ws-num3 or ws-sort-num4 = ws-num4
                        or   ws-sort-num4 = ws-num5 or ws-sort-num4 = ws-num6
                        or   ws-sort-num4 = ws-num7 or ws-sort-num4 = ws-num8
                        or   ws-sort-num4 = ws-num9 or ws-sort-num4 = ws-num10 then
                             if   ws-sort-num5 = ws-num1 or ws-sort-num5 = ws-num2
                             or   ws-sort-num5 = ws-num3 or ws-sort-num5 = ws-num4
                             or   ws-sort-num5 = ws-num5 or ws-sort-num5 = ws-num6
                             or   ws-sort-num5 = ws-num7 or ws-sort-num5 = ws-num8
                             or   ws-sort-num5 = ws-num9 or ws-sort-num5 = ws-num10 then
                                  if   ws-sort-num6 = ws-num1 or ws-sort-num6 = ws-num2
                                  or   ws-sort-num6 = ws-num3 or ws-sort-num6 = ws-num4
                                  or   ws-sort-num6 = ws-num5 or ws-sort-num6 = ws-num6
                                  or   ws-sort-num6 = ws-num7 or ws-sort-num6 = ws-num8
                                  or   ws-sort-num6 = ws-num9 or ws-sort-num6 = ws-num10 then
                                       move function current-date(9:6)  to  ws-hora-final
                                       display "PARABENS VOCE VENCEU!"
                                       display ws-num1 " - " ws-num2 " - " ws-num3 " - "
                                       ws-num4 " - " ws-num5 " - " ws-num6 " - " ws-num7
                                       " - " ws-num8 " - " ws-num9 " - " ws-num10 " - "
      *> Chamar a section que calcula o tempo de sorteio
                                       perform temp-sorteando
                                       display "O Tempo que voce levou para acertar: " ws-diferenca-hr " : " ws-diferenca-min " : " ws-diferenca-seg
                                       display "Quantidade de Sorteios que foram necessarias até voce ganha: " ws-contador

                                       perform finaliza
                                  else
                                       perform sorteio
                                 end-if
                             end-if
                         end-if
                     end-if
                end-if
           end-if
            .

       confere-aposta-exit.
           exit.

      *>---------------------------------------------------------------------------------
      *> Section que computa o tempo que os números ficaram sorteando
      *>---------------------------------------------------------------------------------
       temp-sorteando section.

           compute ws-diferenca-hr  = (ws-hor - ws-hor-fim)
           compute ws-diferenca-min = (ws-min - ws-min-fim)
           compute ws-diferenca-seg = (ws-seg - ws-seg-fim)

           .
       temp-sorteando-exit.
           exit.

      *>---------------------------------------------------------------------------------
      *> Finalização
      *>---------------------------------------------------------------------------------
       finaliza section.
           stop run.
            .
       finaliza-exit.
           exit.


