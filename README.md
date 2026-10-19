# AOC II – Trabalho em Grupo 1 · Tema 1: "O Linux dos processadores": RISC-V

Faculdade Cotemig · Arquitetura e Organização de Computadores II · Prof. Luiz Mesquita

## Integrantes
- Diego Rocha
- Pedro Diniz
- Gabriel
- Arthur

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
3. Vá em **Simulator** → **Run** e confira os registradores (Display Settings → Decimal)

**Resultado esperado:** `s0 = 15`, `s1 = 10`, `s2 = 5`, `t0 = 12`, `s3 = 2`, `s4 = 2`, `s5 = 0`, `s6 = 50`

## Comparação MIPS × RISC-V
| Operação | MIPS | RISC-V |
|---|---|---|
| Carregar valor | `addi $s1, $zero, 10` | `addi
