programa
{          //BIBLIOTECAS
    inclua biblioteca Texto --> tex   
    inclua biblioteca Mouse --> m
    inclua biblioteca Util --> u
    inclua biblioteca Teclado --> t
    inclua biblioteca Graficos --> g
    inclua biblioteca Sons --> s
    
     //TAMANHO DA TELA 
    const inteiro LARGURA_JANELA=800
    const inteiro ALTURA_JANELA=600
     
     //DECLARAR IMAGENS
    inteiro vila = g.carregar_imagem("123pedro123.png")
    inteiro fundo = g.carregar_imagem("b.jpg")
    inteiro char1 = g.carregar_imagem("arthas.png")
    inteiro char2 = g.carregar_imagem("alleria.png")
    inteiro heart = g.carregar_imagem("heartP.png")
    inteiro key = g.carregar_imagem("mini-keyP.png")
    inteiro game = g.carregar_imagem("controleP.png")
    inteiro big_key = g.carregar_imagem("keyP.png")
    inteiro primeira = g.carregar_imagem("entrada_vila.jpg")
    inteiro segunda = g.carregar_imagem("meio_vila.jpg")
    inteiro terceira = g.carregar_imagem("imperatriz.jpg")
    inteiro quarta = g.carregar_imagem("explicacao.jpg")
    inteiro escolhaP = g.carregar_imagem("escolhaP.jpg")
    inteiro final = g.carregar_imagem("real_monster.jpg")
    inteiro die = g.carregar_imagem("you-died-died.gif")
    inteiro alleria = g.carregar_imagem("alleria.jpg")
    inteiro arthas = g.carregar_imagem("arthas.jpg")
    inteiro fundoslot = g.carregar_imagem("casino.jpg")
    inteiro dragslot = g.carregar_imagem("wyvern.png")
    inteiro perdslot = g.carregar_imagem("sly.png")
    inteiro heartslot = g.carregar_imagem("heart.png")
    inteiro fundoQuiz = g.carregar_imagem("magicalQuiz.jpg")
    inteiro quizHP = g.carregar_imagem("quizHP.jpg")
    inteiro melhorClasse = g.carregar_imagem("melhorClasse.jpg")
    inteiro quizDrag = g.carregar_imagem("quizDrag.jpg")
    inteiro quizEscolha = g.carregar_imagem("quizEscolha.jpg")
    inteiro quizSatis = g.carregar_imagem("satisf.jpg")
    inteiro quizSisterAP = g.carregar_imagem("sisterAP.jpg")

    
	//SONS
	inteiro soundDie = s.carregar_som("youdied.mp3")
	inteiro soundHero = s.carregar_som("ct-hero.mp3")
	inteiro soundSuzan = s.carregar_som("querido.mp3")
	inteiro soundSuzanVillain = s.carregar_som("risadaSuzan.mp3")
	inteiro soundHeavyRain = s.carregar_som("heavy-rain.mp3")

    //MOVIMENTAÇÕES
    logico direita=falso,esquerda=falso,para_cima=falso,para_baixo=falso
    inteiro xmovimento_personagem=275
    inteiro ymovimento_personagem=275
    inteiro delay=120
    
     //VALORES DE ATRIBUTOS E ITENS
    inteiro Vida=10
    inteiro chave=0
    inteiro chaveP=0
    inteiro delayMorte = 9
    inteiro personagem = 0
    inteiro slotVet[3]
    inteiro repete = 0
    inteiro repeteQuiz = 0
    inteiro listaValor[2][2] = {{0, 50},{100, 166}}
    inteiro pontuacaoQ = 0

 
    
    funcao inicio()
    {
    		Montar_Janela_Cut1()
    }

	//Função que chama a VILA
    funcao inicioJogo()
    {
    		s.reproduzir_som(soundHeavyRain, verdadeiro)
		s.definir_volume(100)
    		s.interromper_som(soundHero)
    		Montar_Janela()
         enquanto(verdadeiro)
         {
         	
		
         	se(chave >= 10)
          {
            chaveP = 1
          }

          se(Vida <= 0)
          {
          	Montar_Janela_CutDie()
          }
            
	        pintar_janela()
	        Desenhar_Painel()
	        Jogador()
	        movimento_player()
	        andar_personagem()
	        g.definir_cor(g.COR_PRETO)
             g.desenhar_retangulo(450, 270, 30,30,falso, falso)
             g.desenhar_retangulo(174, 370, 30,30,falso, falso)
             g.desenhar_retangulo(380, 470, 30,30,falso, falso)
             g.desenhar_retangulo(680, 470, 30,30,falso, falso)
	        
	        g.renderizar()
	        u.aguarde(delay)

			se(t.tecla_pressionada(t.TECLA_F))
			{
				chave = chave + 1
			}
			se(mouse(680, 470, 30,30) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO) e repete!=3) 
			{
				inicio_slot() 
			}
			se(mouse(174, 370, 30,30) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO) e repeteQuiz!=3) 
			{
				inicio_MagicQuiz()
			}
			se(mouse(380, 470, 30,30) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO) e repete!=3) 
			{
				
			}
			se(mouse(450, 270, 30,30) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO) e chaveP == 1) 
			{
				 Montar_Janela_CutFinal()
			}
	        
	        se(chave == 10)
	        {
	        	chaveP = 1
	        		se(chaveP == 1)
	        		{
	        			Montar_Janela_CutFinal()
	        		}
	        }
         }     
    }

    //Função TelaVila
	funcao Montar_Janela()
	{
	g.iniciar_modo_grafico(verdadeiro)
	g.definir_dimensoes_janela(LARGURA_JANELA, ALTURA_JANELA)
	g.definir_titulo_janela("UTFPR Tales")
	}

     funcao Desenhar_Painel()
     {

	     g.definir_cor(g.COR_PRETO)
	     g.desenhar_retangulo(0, 0, LARGURA_JANELA, 50, falso, verdadeiro)
	     g.definir_cor(g.COR_AMARELO)
	     g.definir_tamanho_texto(25.0)
	     g.desenhar_texto(40, 10, "HP=" + Vida  )
	     g.desenhar_texto(200, 10, "Piece of Key=" + chave)
	     g.desenhar_texto(500, 10, "Pedro's Key=" + chaveP  )
	     g.desenhar_imagem(470, 10, big_key)
	     g.desenhar_imagem(170, 10, key)
	     g.desenhar_imagem(7,10,heart)
	     g.desenhar_imagem(450,270,game)
	     g.desenhar_imagem(174,370,game)
	     g.desenhar_imagem(380,470,game)
	     g.desenhar_imagem(680,470,game)
      }
      
      funcao pintar_janela()
      {
          g.definir_cor(g.COR_BRANCO)
          g.desenhar_imagem(0, 0, vila)
     
      }

	//Cutsceanes
     funcao Montar_Janela_Cut1()
	{
          g.iniciar_modo_grafico(verdadeiro)
          g.definir_dimensoes_janela(LARGURA_JANELA, ALTURA_JANELA)
          g.definir_titulo_janela("A definir")

          s.reproduzir_som(soundHero, falso)
		s.definir_volume(100)

          enquanto(verdadeiro)
		{
			g.desenhar_imagem(0, 0, primeira)
			g.renderizar()

			se(t.tecla_pressionada(t.TECLA_ESPACO))
			{
				Montar_Janela_Cut2()
			}
		}
	}
	
	funcao Montar_Janela_Cut2()
	{
          g.iniciar_modo_grafico(verdadeiro)
          g.definir_dimensoes_janela(LARGURA_JANELA, ALTURA_JANELA)
          g.definir_titulo_janela("A definir")

          enquanto(verdadeiro)
		{
			g.desenhar_imagem(0, 0, segunda)
			g.renderizar()

			se(t.tecla_pressionada(t.TECLA_ESPACO))
				{
					Montar_Janela_Cut3()
				}
		}
	}

	funcao Montar_Janela_Cut3()
	{
          g.iniciar_modo_grafico(verdadeiro)
          g.definir_dimensoes_janela(600, 600)
          g.definir_titulo_janela("A definir")

          s.reproduzir_som(soundSuzan, falso)
		s.definir_volume(100)

          enquanto(verdadeiro)
		{
			g.desenhar_imagem(0, 0, terceira)
			g.renderizar()

			se(t.tecla_pressionada(t.TECLA_ESPACO))
				{
					Montar_Janela_Cut4()
				}
		}
	}

	funcao Montar_Janela_Cut4()
	{
          g.iniciar_modo_grafico(verdadeiro)
          g.definir_dimensoes_janela(LARGURA_JANELA, ALTURA_JANELA)
          g.definir_titulo_janela("A definir")
          s.reproduzir_som(soundHeavyRain, verdadeiro)
		s.definir_volume(100)

          enquanto(verdadeiro)
		{
			g.desenhar_imagem(0, 0, quarta)
			g.renderizar()

			se(t.tecla_pressionada(t.TECLA_ESPACO))
				{
					Montar_Janela_CutEscolha()
				}
		}
	}

	funcao Montar_Janela_CutArthas()
	{
          g.iniciar_modo_grafico(verdadeiro)
          g.definir_dimensoes_janela(1680, 1050)
          g.definir_titulo_janela("A definir")

          enquanto(verdadeiro)
		{
			g.desenhar_imagem(0, 0, arthas)
			g.renderizar()

			se(t.tecla_pressionada(t.TECLA_ESPACO))
				{
					inicioJogo()
				}
		}
	}

	funcao Montar_Janela_CutAlleria()
	{
          g.iniciar_modo_grafico(verdadeiro)
          g.definir_dimensoes_janela(1680, 1050)
          g.definir_titulo_janela("A definir")

          enquanto(verdadeiro)
		{
			g.desenhar_imagem(0, 0, alleria)
			g.renderizar()

			se(t.tecla_pressionada(t.TECLA_ESPACO))
				{
					inicioJogo()
				}
		}
	}

	funcao Montar_Janela_CutEscolha()
	{
          g.iniciar_modo_grafico(verdadeiro)
          g.definir_dimensoes_janela(1680, 1050)
          g.definir_titulo_janela("A definir")

          enquanto(verdadeiro)
		{
			g.desenhar_imagem(0, 0, escolhaP)
			g.renderizar()

			se(mouse(300, 150, 300, 890) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO))
			{
				personagem = 1
				//PHomem
				g.definir_cor(g.COR_VERMELHO)
				g.desenhar_retangulo(300, 150, 300, 890, verdadeiro, verdadeiro)
				Montar_Janela_CutArthas()
			}
			senao
				se(mouse(1150, 150, 300, 890) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO))
				{
					personagem = 2
					//PMulher
					g.definir_cor(g.COR_VERMELHO)
					g.desenhar_retangulo(1150, 150, 300, 890, verdadeiro, verdadeiro)
					Montar_Janela_CutAlleria()
				}
		}
	}

	funcao Montar_Janela_CutFinal()
	{
          g.iniciar_modo_grafico(verdadeiro)
          g.definir_dimensoes_janela(1280, 720)
          g.definir_titulo_janela("A definir")

          s.reproduzir_som(soundSuzanVillain, falso)
		s.definir_volume(100)

          enquanto(verdadeiro)
		{
			g.desenhar_imagem(0, 0, final)
			g.renderizar()

			se(t.tecla_pressionada(t.TECLA_ESPACO))
				{
					Montar_Janela_CutDie()
				}
		}
	}

	funcao Montar_Janela_CutDie()
	{
          g.iniciar_modo_grafico(verdadeiro)
          g.definir_dimensoes_janela(LARGURA_JANELA, ALTURA_JANELA)
          g.definir_titulo_janela("A definir")

		s.reproduzir_som(soundSuzanVillain, verdadeiro)
          s.reproduzir_som(soundDie, falso)
		s.definir_volume(100)

          enquanto(verdadeiro)
		{
			g.definir_cor(g.COR_PRETO)
			g.desenhar_imagem(300, 250, die)
			g.renderizar()

			se(t.tecla_pressionada(t.TECLA_ESPACO))
				{
					g.fechar_janela()
				}
		}
	}


	//Slot Machine
     funcao inicio_slot()
     {
     	Montar_Janela_Slot()
        enquanto(verdadeiro)
        {
            g.desenhar_imagem(0, 0, fundoslot)
            SlotMaxxine()
            g.renderizar()
        }
     }
	funcao Montar_Janela_Slot()
	{
          g.iniciar_modo_grafico(verdadeiro)
          g.definir_dimensoes_janela(LARGURA_JANELA, ALTURA_JANELA)
          g.definir_titulo_janela("Slot Maxxine")
	}

	funcao SlotJogo()
	{
		faca
		{
			slotVet[0] = u.sorteia(1, 3)
			slotVet[1] = u.sorteia(1, 3)
			slotVet[2] = u.sorteia(1, 3)
	
			se(slotVet[0] == 1 e slotVet[1] == 1 e slotVet[2] == 1)
			{
				escreva("\nO jogador perdeu 1 de HP.")
				RespostaCertaPerca()
				para(Vida=10;Vida>=7;Vida--)
				{
					
				}
				repete = repete + 1
			}
			senao
				se(slotVet[0] == 2 e slotVet[1] == 2 e slotVet[2] == 2)
				{
					escreva("\nO jogador ganhou 1 de HP.")
					RespostaCertaHeart()
					Vida = Vida + 3
					repete = repete + 1
				}
				senao
					se(slotVet[0] == 3 e slotVet[1] == 3 e slotVet[2] == 3)
					{
						escreva("\nO jogador ganhou 1x Pieces of Key")
						RespostaCertaDrag()
						chave = chave + 1
						repete = repete + 1
					}
					senao
					{
						repete = repete + 1
					}
		}enquanto(repete != 3)

		se(repete == 3)
		{
			inicioJogo()
		}
		
	}

	funcao SlotMaxxine()
	{
		se(mouse(550, 150, 100, 270) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO))
		{
			g.definir_cor(g.COR_VERMELHO)
			g.desenhar_retangulo(550, 150, 100, 270, verdadeiro, falso)
			
			SlotJogo()
		}
	}

	funcao RespostaCertaDrag()
	{
		//1 Resultado
		g.desenhar_imagem(270, 285, dragslot)
		u.aguarde(300)

		//2 Resultado
		g.desenhar_imagem(373, 285, dragslot)
		u.aguarde(300)
		
		//3 Resultado
		g.desenhar_imagem(475, 285, dragslot)
		u.aguarde(300)
	}

	funcao RespostaCertaHeart()
	{
		//1 Resultado
		g.desenhar_imagem(270, 285, heartslot)
		u.aguarde(300)

		//2 Resultado
		g.desenhar_imagem(373, 285, heartslot)
		u.aguarde(300)

		//3 Resultado
		g.desenhar_imagem(475, 285, heartslot)
		u.aguarde(300)
	}

	funcao RespostaCertaPerca()
	{
		//1 Resultado
		g.desenhar_imagem(270, 285, perdslot)
		u.aguarde(300)

		//2 Resultado
		g.desenhar_imagem(373, 285, perdslot)
		u.aguarde(300)
		
		//3 Resultado
		g.desenhar_imagem(475, 285, perdslot)
		u.aguarde(300)
	}

	//MagicQuiz
	funcao inicio_MagicQuiz()
	{
		s.reproduzir_som(soundHero, falso)
		s.definir_volume(50)
		Montar_Janela_Quiz()
		enquanto(verdadeiro)
		{
			g.desenhar_imagem(0, 0, fundoQuiz)
			g.renderizar()

			se(t.tecla_pressionada(t.TECLA_ESPACO))
			{
				Montar_Janela_Quiz2()
			}
		}
	}

	funcao Montar_Janela_Quiz()
	{
          g.iniciar_modo_grafico(verdadeiro)
          g.definir_dimensoes_janela(LARGURA_JANELA, ALTURA_JANELA)
          g.definir_titulo_janela("Magical Quiz")
	}

	funcao Montar_Janela_Quiz2()
	{
          g.iniciar_modo_grafico(verdadeiro)
          g.definir_dimensoes_janela(LARGURA_JANELA, ALTURA_JANELA)
          g.definir_titulo_janela("Magical Quiz")

          enquanto(verdadeiro)
		{
			g.desenhar_imagem(0, 0, quizHP)
			g.renderizar()

			se(mouse(10, 420, 265, 140) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO))
				{
					pontuacaoQ = pontuacaoQ + listaValor[0][1]
					Montar_Janela_Quiz3()
				}
				senao
					se(mouse(319, 420, 245, 140) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO))
					{
						pontuacaoQ = pontuacaoQ + listaValor[1][1]
						Montar_Janela_Quiz3()
					}
					senao
						se(mouse(580, 420, 200, 140) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO))
						{
							pontuacaoQ = pontuacaoQ + listaValor[0][0]
							Vida = Vida - 1
							Montar_Janela_Quiz3()
						}
		}
	}
	
	funcao Montar_Janela_Quiz3()
	{
          g.iniciar_modo_grafico(verdadeiro)
          g.definir_dimensoes_janela(LARGURA_JANELA, ALTURA_JANELA)
          g.definir_titulo_janela("Magical Quiz")
          

          enquanto(verdadeiro)
		{
			g.desenhar_imagem(0, 0, melhorClasse)
			g.renderizar()

			se(mouse(30, 300, 150, 400) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO))
				{
					pontuacaoQ = pontuacaoQ + listaValor[0][1]
					Montar_Janela_Quiz4()
				}
				senao
					se(mouse(330, 300, 170, 400) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO))
					{
						pontuacaoQ = pontuacaoQ + listaValor[1][1]
						chave = chave + 1
						Montar_Janela_Quiz4()
					}
					senao
						se(mouse(625, 300, 150, 215) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO))
						{
							pontuacaoQ = pontuacaoQ + listaValor[0][1]
							Montar_Janela_Quiz4()
						}
						senao
							se(mouse(625, 530, 150, 55) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO))
							{
								pontuacaoQ = pontuacaoQ + listaValor[0][0]
								Vida = Vida - 1
								Montar_Janela_Quiz4()
							}
		}
	}

	funcao Montar_Janela_Quiz4()
	{
          g.iniciar_modo_grafico(verdadeiro)
          g.definir_dimensoes_janela(LARGURA_JANELA, ALTURA_JANELA)
          g.definir_titulo_janela("Magical Quiz")

          enquanto(verdadeiro)
		{
			g.desenhar_imagem(0, 0, quizSisterAP)
			g.renderizar()

			se(mouse(30, 460, 110, 100) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO))
				{
					pontuacaoQ = pontuacaoQ + listaValor[0][0]
					Vida = Vida - 1
					Montar_Janela_Quiz5()
				}
				senao
					se(mouse(240, 460, 125, 100) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO))
					{
						pontuacaoQ = pontuacaoQ + listaValor[0][1]
						Montar_Janela_Quiz5()
					}
					senao
						se(mouse(440, 460, 110, 100) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO))
						{
							pontuacaoQ = pontuacaoQ + listaValor[1][1]
							Montar_Janela_Quiz5()
						}
						senao
							se(mouse(620, 460, 140, 100) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO))
							{
								pontuacaoQ = pontuacaoQ + listaValor[1][0]
								Montar_Janela_Quiz5()
							}
		}
	}

	funcao Montar_Janela_Quiz5()
	{
          g.iniciar_modo_grafico(verdadeiro)
          g.definir_dimensoes_janela(LARGURA_JANELA, ALTURA_JANELA)
          g.definir_titulo_janela("Magical Quiz")
          
          enquanto(verdadeiro)
		{
			g.desenhar_imagem(0, 0, quizSatis)
			g.renderizar()

			se(mouse(40, 420, 110, 140) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO))
				{
					pontuacaoQ = pontuacaoQ + listaValor[0][0]
					Vida = Vida - 1
					Montar_Janela_Quiz6()
				}
				senao
					se(mouse(275, 420, 245, 140) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO))
					{
						pontuacaoQ = pontuacaoQ + listaValor[1][1]
						Montar_Janela_Quiz6()
					}
					senao
						se(mouse(580, 420, 240, 140) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO))
						{
							pontuacaoQ = pontuacaoQ + listaValor[0][1]
							Montar_Janela_Quiz6()
						}
		}
	}

	funcao Montar_Janela_Quiz6()
	{
          g.iniciar_modo_grafico(verdadeiro)
          g.definir_dimensoes_janela(LARGURA_JANELA, ALTURA_JANELA)
          g.definir_titulo_janela("Magical Quiz")

          enquanto(verdadeiro)
		{
			g.desenhar_imagem(0, 0, quizDrag)
			g.renderizar()

			se(mouse(580, 420, 200, 140) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO))
				{
					pontuacaoQ = pontuacaoQ + listaValor[0][1]
					Montar_Janela_Quiz7()
				}
				senao
					se(mouse(250, 420, 300, 140) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO))
					{
						pontuacaoQ = pontuacaoQ + listaValor[1][1]
						Montar_Janela_Quiz7()
					}
					senao
						se(mouse(5, 420, 220, 140) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO))
						{
							pontuacaoQ = pontuacaoQ + listaValor[1][0]
							Montar_Janela_Quiz7()
						}
		}
	}

	funcao Montar_Janela_Quiz7()
	{
          g.iniciar_modo_grafico(verdadeiro)
          g.definir_dimensoes_janela(LARGURA_JANELA, ALTURA_JANELA)
          g.definir_titulo_janela("Magical Quiz")
          

          enquanto(verdadeiro)
		{
			g.desenhar_imagem(0, 0, quizEscolha)
			s.interromper_som(soundHero)
			g.renderizar()

			se(mouse(15, 420, 220, 140) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO))
				{
					pontuacaoQ = pontuacaoQ + listaValor[1][0]
					Vida = Vida - 5
					chave = chave + 3
					escreva("\n", pontuacaoQ)

					se(pontuacaoQ >= 900)
					{
						chave = chave + 5
						Montar_Janela_Quiz_P()
					}
					senao
						se(pontuacaoQ >= 500)
						{
							chave = chave + 3
							Montar_Janela_Quiz_P()
						}
						senao
							se(pontuacaoQ <= 300)
							{
								chave = chave + 1
								Vida = Vida - 2
								Montar_Janela_Quiz_P()
							}
				}
				senao
					se(mouse(470, 420, 300, 140) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO))
					{
						pontuacaoQ = pontuacaoQ + listaValor[1][1]
						escreva("\n", pontuacaoQ)
						chave = chave + 1

						se(pontuacaoQ >= 900)
						{
							chave = chave + 5
							Montar_Janela_Quiz_P()
						}
						senao
							se(pontuacaoQ >= 500)
							{
								chave = chave + 3
								Montar_Janela_Quiz_P()
							}
							senao
								se(pontuacaoQ <= 300)
								{
									chave = chave + 1
									Vida = Vida - 2
									Montar_Janela_Quiz_P()
								}
					}
		}
	}

	funcao Montar_Janela_Quiz_P()
	{	
		g.iniciar_modo_grafico(verdadeiro)
          g.definir_dimensoes_janela(LARGURA_JANELA, ALTURA_JANELA)
          g.definir_titulo_janela("Magical Quiz")
          enquanto(verdadeiro)
		{
			g.definir_cor(g.COR_PRETO)

			g.definir_cor(g.COR_AZUL)
         		g.definir_tamanho_texto(30.0)
         		g.desenhar_texto(258, 300, "Pontuação do Quiz: " + pontuacaoQ)
			g.renderizar()

			se(t.tecla_pressionada(t.TECLA_ESPACO))
				{
					repeteQuiz = repeteQuiz + 1
					inicioJogo()
				}
		}
	}
	
	//Reconhecimento de Mouse
	funcao logico mouse(inteiro x, inteiro y, inteiro a, inteiro b)
    	{
    		se(m.posicao_x() >= x e m.posicao_y() >= y e m.posicao_x() <= x+a e m.posicao_y() <= y+b)
    		{
    			retorne verdadeiro
    		}
    		senao
    		{
    			retorne falso
    		}
    	}

	//Movimento Jogador
    	funcao movimento_player()
	{
	  se(t.tecla_pressionada(t.TECLA_SETA_DIREITA))
	  {
	     direita = verdadeiro
	    esquerda = falso
	       para_cima = falso
	       para_baixo = falso
	  }
	  senao se(t.tecla_pressionada(t.TECLA_SETA_ESQUERDA))
	  {
	     esquerda = verdadeiro 
	      direita = falso
	     para_cima = falso
	     para_baixo = falso                       
	  }
	  senao se(t.tecla_pressionada(t.TECLA_SETA_ACIMA))
	  {
	      direita = falso
	     esquerda = falso
	     para_cima = verdadeiro
	     para_baixo = falso                                                   
	  }
	  senao se(t.tecla_pressionada(t.TECLA_SETA_ABAIXO))
	  {
	      para_baixo = verdadeiro
	      direita = falso
	     esquerda = falso
	     para_cima = falso  
	  }
	  senao
	  {
	        para_baixo = falso
	       direita = falso
	    esquerda = falso
	    para_cima = falso
	  }                   
	 }

	funcao Jogador()
      {
      	se(personagem == 1)
      	{
      		g.desenhar_imagem(xmovimento_personagem,ymovimento_personagem, char1)
      	}
      	senao
      		se(personagem == 2)
      		{
      			g.desenhar_imagem(xmovimento_personagem,ymovimento_personagem, char2)
      		}
      }
      
     funcao andar_personagem()

     
      {

          se(direita)
          {
              xmovimento_personagem+=25
          }
          senao se(esquerda)
          {
              xmovimento_personagem-=25
          }
          se(para_cima)
          {
              ymovimento_personagem-=25
          }
          senao se(para_baixo)
          {
              ymovimento_personagem+=25
          }         
     }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3759; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */