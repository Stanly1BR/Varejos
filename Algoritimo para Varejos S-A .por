programa
{
    inclua biblioteca Tipos --> tp
    inclua biblioteca Texto --> t
    
    funcao inicio()
    {
        inteiro opcao_inteiro = 0, numb, soma, pais, dv = 0
        caracter dg
        cadeia enter, opcao = "", codigo_bruto, codigo = "", opcao_limpa = ""
        logico opcao_valida

        faca {
            limpa()
            escreva("--------------------------\n")
            escreva("       VAREJOS S/A\n")
            escreva("Codigo GTIN-13/UPC/EAN-13\n")
            escreva("--------------------------\n")
            escreva("   1) Validar Código GTIN-13\n")
            escreva("   2) Identificar País\n")
            escreva("   3) Sair\n")
            escreva("---------------------\n")
            escreva("Digite a opção: ")
            leia(opcao)
            
            // Limpa a entrada da opção
            opcao_limpa = ""
            para(inteiro i = 0; i < t.numero_caracteres(opcao); i++) {
                dg = tp.cadeia_para_caracter(t.extrair_subtexto(opcao, i, i+1))
                escolha(dg) {
                    caso '0': caso '1': caso '2': caso '3': caso '4': 
                    caso '5': caso '6': caso '7': caso '8': caso '9': 
                        opcao_limpa = opcao_limpa + dg
                    pare
                }
            }
            
            // Verifica se a opção é válida
            se (t.numero_caracteres(opcao_limpa) == 1) {
                opcao_inteiro = tp.cadeia_para_inteiro(opcao_limpa, 10)
                opcao_valida = (opcao_inteiro == 1 ou opcao_inteiro == 2 ou opcao_inteiro == 3)
            } senao {
                opcao_valida = falso
            }

            // Processa a opção se for válida
            se (opcao_valida) {
                se (opcao_inteiro == 1 ou opcao_inteiro == 2) {
                    limpa()
                    escreva("--------------------------\n")
                    escreva("       VAREJOS S/A\n")
                    escreva("Codigo GTIN-13/UPC/EAN-13\n")
                    escreva("--------------------------\n")
                    
                    se (opcao_inteiro == 1) {
                        escreva("VALIDAR CÓDIGO\n")
                    } senao {
                        escreva("Identificar País\n")
                    }

                    escreva("Digite o código de 13 dígitos: ")
                    leia(codigo_bruto)
                    
                    // Limpa o código
                    codigo = ""
                    para(inteiro i = 0; i < t.numero_caracteres(codigo_bruto); i++) {
                        dg = tp.cadeia_para_caracter(t.extrair_subtexto(codigo_bruto, i, i+1))
                        escolha(dg) {
                            caso '0': caso '1': caso '2': caso '3': caso '4': 
                            caso '5': caso '6': caso '7': caso '8': caso '9': 
                                codigo = codigo + dg
                            pare
                        }
                    }
                    
                    // Verifica se o código tem 13 dígitos
                    se (t.numero_caracteres(codigo) != 13) {
                        escreva("Número GTIN-13 não tem 13 dígitos!\n")
                    } senao {
                        // Calcula o dígito verificador
                        soma = 0
                        para(inteiro i = 0; i < 12; i++) {
                            numb = tp.cadeia_para_inteiro(t.extrair_subtexto(codigo, i, i+1), 10)
                            se(i % 2 == 0) {
                                soma = soma + numb
                            } senao {
                                soma = soma + (numb * 3)
                            }
                        }
                        dv = (10 - (soma % 10)) % 10
                        
                        // Verifica o dígito verificador
                        se (dv != tp.cadeia_para_inteiro(t.extrair_subtexto(codigo, 12, 13), 10)) {
                            escreva("Número GTIN-13 inválido!\n")
                            escreva("Dígito verificador calculado: ", dv, "\n")
                            escreva("Dígito verificador informado: ", t.extrair_subtexto(codigo, 12, 13), "\n")
                        } senao {
                            se (opcao_inteiro == 1) {
                                escreva("Código válido!\n")
                            } senao {
                                // Identifica o país
                                pais = tp.cadeia_para_inteiro(t.extrair_subtexto(codigo, 0, 3), 10)
                                escolha(pais) {
                                    caso 789: caso 790:
                                        escreva("\nGTIN-13 origem Brasil: ", pais)
                                    pare
                                    caso 779:
                                        escreva("\nGTIN-13 origem Argentina: ", pais)
                                    pare
                                    caso 773:
                                        escreva("\nGTIN-13 origem Uruguai: ", pais)
                                    pare
                                    caso 780:
                                        escreva("\nGTIN-13 origem Chile: ", pais)
                                    pare
                                    caso 784:
                                        escreva("\nGTIN-13 origem Paraguai: ", pais)
                                    pare
                                    caso 786:
                                        escreva("\nGTIN-13 origem Equador: ", pais)
                                    pare
                                    caso 770:
                                        escreva("\nGTIN-13 origem Colômbia: ", pais)
                                    pare
                                    caso 743:
                                        escreva("\nGTIN-13 origem Nicarágua: ", pais)
                                    pare
                                    caso 600: caso 601:
                                        escreva("\nGTIN-13 origem África do Sul: ", pais)
                                    pare
                                    caso contrario:
                                        escreva("\nVAREJOS S/A não vende para este país: ", pais)
                                }
                            }
                        }
                    }
                    
                    escreva("\nDigite ENTER para continuar...")
                    leia(enter)
                } 
            } senao {
                escreva("\nOpção inválida!")
                escreva("\nDigite ENTER para continuar...")
                leia(enter)
            }
        } enquanto (opcao_inteiro != 3)
    }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 631; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */