# AOC II – Trabalho em Grupo 1 · Tema 1: "O Linux dos processadores": RISC-V

Faculdade Cotemig · Arquitetura e Organização de Computadores II · Prof. Luiz Mesquita

## Integrantes
Diego Rocha - Pedro Diniz - Gabriel - Arthur

## Pergunta
Por que empresas do mundo todo estão trocando processadores pagos por um "processador open source"?

## Artigo base
CUI, E. et al. **RISC-V Instruction Set Architecture Extensions: A Survey.** *IEEE Access*, v. 11, 2023.
DOI: [10.1109/ACCESS.2023.3246491](https://ieeexplore.ieee.org/document/10049118)

## Resumo da teoria
- **ISA** é o "contrato" entre software e hardware: define as instruções que o processador entende.
- **x86 e ARM** são ISAs proprietárias (exigem licença e royalties). **RISC-V** é aberta e gratuita.
- O RISC-V é **modular**: uma base mínima de inteiros (**RV32I**) + extensões opcionais, como
  **M** (multiplicação/divisão), **F/D** (ponto flutuante), **C** (instruções comprimidas) e **V** (vetores).
- Isso permite que um sensor IoT use só RV32I + C, enquanto um servidor usa RV64 + M + F/D + V.

## Experimento
Escrevemos um programa com soma, subtração, divisão, resto, desvio condicional e multiplicação
de 64 bits, em RISC-V e em MIPS, e comparamos as duas versões.

| Pasta | Conteúdo | Simulador |
|---|---|---|
| `riscv/programa.s` | Versão RISC-V | [Venus](https://venus.cs61c.org/) |
| `mips/programa.asm` | Versão MIPS equivalente | MARS |

### Como executar (RISC-V)
1. Acesse https://venus.cs61c.org/
2. Cole o conteúdo de `riscv/programa.s` na aba **Editor**
3. Vá em **Simulator** → **Run** e confira os registradores

**Resultado esperado:** `s0 = 15`, `s1 = 10`, `s2 = 5`, `t0 = 12`, `s3 = 2`, `s4 = 2`, `s5 = 0`, `s6 = 50`

## Comparação MIPS × RISC-V
| Operação | MIPS | RISC-V |
|---|---|---|
| Carregar valor | `addi $s1, $zero, 10` | `addi s1, zero, 10` |
| Soma | `add $s0, $s1, $s2` | `add s0, s1, s2` |
| Divisão | `div $t0, $s2` + `mflo $s3` | `div s3, t0, s2` |
| Resto | `mfhi $s4` | `rem s4, t0, s2` |
| Desvio | `beq $s4, $s3, ali` | `beq s4, s3, ali` |
| Multiplicação 64 bits | `mult $s1, $s2` + `mfhi $s5` + `mflo $s6` | `mulh s5, s1, s2` + `mul s6, s1, s2` |

**O que mudou:** os registradores perdem o `$`, e o RISC-V não usa os registradores especiais **HI/LO**:
divisão, resto e multiplicação escrevem direto no registrador de destino.

### Instruções executadas
| Versão | Instruções executadas |
|---|---|
| MIPS | 12 |
| RISC-V | 10 |

### Base ou extensão?
| Grupo | Instruções usadas |
|---|---|
| Base **RV32I** | `addi`, `add`, `sub`, `beq`, `j` (pseudo-instrução de `jal`) |
| Extensão **M** | `div`, `rem`, `mulh`, `mul` |

## Conclusão
O resultado confirma a teoria porque as operações simples (soma, subtração, desvio) foram resolvidas
apenas com a base **RV32I**, e só as operações de multiplicação e divisão precisaram da **extensão M**,
exatamente como o artigo descreve: uma base mínima + extensões adicionadas conforme a necessidade.

## Uso de IA
Usamos IA para revisar o código, montar a versão MIPS equivalente e organizar este README.
Todo o conteúdo foi conferido pelo grupo nos simuladores.
