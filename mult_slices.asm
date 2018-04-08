addi $a1, $zero, 1
add $a3, $zero, $gp
for_iniA:
sw $a1, 0 ($a3)
addi $a3, $a3, 4 
addi $a1, $a1, 1
bne $a1, 17, for_iniA

addi $a1, $zero, 1
for_iniB:
sw $a1, 0 ($a3)
addi $a3, $a3, 4 
addi $a1, $a1, 1
bne $a1, 17, for_iniB


add $t1, $zero, $zero #t1 = k
add $a0, $zero, $zero
addi $s1, $gp, 124 # para vetor C

for_k:
add $t2, $zero, $t1 #t2 = j

for_j:
mul $t4, $t1, 4 #t4 = k*4
add $t3, $zero, $t4  #t3 = i

for_i:
addi $s1, $s1, 4 # vetor C
mul $s2, $t2, 4 # vetor A j
mul $s3, $t3, 4 # vetor B i
addi $s3, $s3, 64
add $s3, $s3, $gp
add $s2, $s2, $gp



lw $s4, 0 ($s2) #A[j]
lw $s5, 0 ($s3) #B[i]

mul $s6,$s4,$s5
sw $s6, 0($s1)

# C[k*16+j+i-(k*5)] = A[j] * B[i];


addi $t5, $t4, 4
addi $t3, $t3, 1
slt $t9, $t3, $t5
bne $t9, 0, for_i

addi $t2, $t2, 4
slti $t8, $t2, 16
bne $t8, 0, for_j

addi $t1, $t1, 1
bne $t1, 4, for_k

add $a2, $zero, $zero
add $t7, $zero, $sp
add $t6, $zero, $zero
addi $s5, $gp, 128
for_l:
#D[i] = C[i] + C[16+i] + C[32+i] + C[48+i];
lw $s1, 0($s5)
lw $s2, 64($s5)
lw $s3, 128($s5)
lw $s4, 192($s5)

add $a2, $a2, $s1
add $a2, $a2, $s2
add $a2, $a2, $s3
add $a2, $a2, $s4

sw $a2, 0($t7)

add $a2, $zero, $zero #resetando a variavel
addi $t7, $t7, 4 #anda no vetor final D
addi $s5, $s5, 4 #anda no vetor C
addi $t6, $t6, 1 #i
bne $t6, 16, for_l

nop
