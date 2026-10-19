# AOC II - Trabalho em Grupo 1 - Tema 1: RISC-V
# Programa em RISC-V (RV32IM) - executar no Venus: https://venus.cs61c.org/
# Instrucoes da base RV32I: addi, add, sub, beq, j (pseudo -> jal)
# Instrucoes da extensao M: div, rem, mulh, mul

addi s1, zero, 10      # s1 = 10
addi s2, zero, 5       # s2 = 5
add  s0, s1, s2        # s0 = s1 + s2 = 15
addi t0, s1, 2         # t0 = s1 + 2 = 12
div  s3, t0, s2        # s3 = 12 / 5 = 2   (extensao M)
rem  s4, t0, s2        # s4 = 12 % 5 = 2   (extensao M)
beq  s4, s3, ali       # se resto == quociente, pula para "ali" (2 == 2 -> pula)
sub  s5, s1, s2        # (nao executa neste teste)
add  s6, s1, s5        # (nao executa neste teste)
j    ali2
ali:
sub  s2, s0, s1        # s2 = 15 - 10 = 5
ali2:
mulh s5, s1, s2        # s5 = 32 bits altos de s1 x s2 = 0   (extensao M)
mul  s6, s1, s2        # s6 = 32 bits baixos de s1 x s2 = 50 (extensao M)
# {s5, s6} = s1 x s2 (resultado de 64 bits)
addi a0, zero, 10      # codigo 10 = encerrar o programa
ecall                  # chamada de sistema: termina sem erro
