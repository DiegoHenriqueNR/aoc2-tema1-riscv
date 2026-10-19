# AOC II - Trabalho em Grupo 1 - Tema 1: RISC-V
# Versao equivalente em MIPS - executar no MARS

        addi $s1, $zero, 10    # s1 = 10
        addi $s2, $zero, 5     # s2 = 5
        add  $s0, $s1, $s2     # s0 = 15
        addi $t0, $s1, 2       # t0 = 12
        div  $t0, $s2          # HI = 12 % 5, LO = 12 / 5
        mflo $s3               # s3 = quociente = 2
        mfhi $s4               # s4 = resto = 2
        beq  $s4, $s3, ali     # 2 == 2 -> pula
        sub  $s5, $s1, $s2     # (nao executa neste teste)
        add  $s6, $s1, $s5     # (nao executa neste teste)
        j    ali2
ali:
        sub  $s2, $s0, $s1     # s2 = 5
ali2:
        mult $s1, $s2          # HI:LO = s1 x s2
        mfhi $s5               # s5 = parte alta = 0
        mflo $s6               # s6 = parte baixa = 50

