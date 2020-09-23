#set byte [0x10000000] = ["Array representation of Heap is:", 10, 0]
call main

; Exit program
mov eax, 10
int 0x80

swap:
    push ebx
    mov	edx, DWORD [esp + 8]
    mov	eax, DWORD [esp + 12]
    mov	ecx, DWORD [edx]
    mov	ebx, DWORD [eax]
    mov	DWORD [edx], ebx
    mov	DWORD [eax], ecx
    pop	ebx
    ret

heapify:
    ;#[esp +4] = arr[]
    ;#[esp +8] = n
    ;#[esp +12] = i
    
   mov ebx, [esp + 12] ;# largest = i
   
    mov eax, 2
    mul ebx ;#eax = 2*i
    add eax, 1
    mov ecx, eax ;#ecx = L

    mov eax, 2
    mul ebx
    add eax, 2 ;#eax = r
if1:
    cmp ecx, [esp + 8]
    jge false_if_1

    push eax
    mov eax, [esp +4]
    mov eax, [eax + ecx *4] ;#arr[l]

    mov edx, [esp + 4]
    mov edx, [edx + ebx * 4];#arr[largest]
    
    cmp eax, edx ;# arr[l] > arr[larg]
    jle false_if_1
    mov ebx, ecx
    pop eax


false_if_1:

if2:
    cmp eax, [esp + 8]
    jge false_if_2

    push ecx

    mov ecx, [esp +4]
    mov ecx, [ecx + eax *4];#arr[r]

    mov edx, [esp + 4]
    mov edx, [edx + ebx * 4];#arr[largest]

    cmp ecx, edx
    jle false_if_2

    mov ebx, eax
    pop ecx

false_if_2:

if3:
    cmp ebx, [esp + 12]
    je false_if_3

    push eax

    
    mov edx, [esp +4]
    mov edx, [edx + ebx * 4]
    lea edx, edx
    push edx ;#&arr[largest]

    mov eax, [esp +12]
    mov edx, [esp +4]
    ;mov edx, [edx + eax * 4]
    lea edx, [edx + eax * 4]
    push edx ;;#&arr[i]
    call swap
    add esp, 8

    mov edx, [esp + 12]
    push edx
    mov edx, [esp + 8]
    push edx
    lea edx, [esp + 4]
    push edx
    call heapify
    add esp, 12



    pop eax

false_if_3:


   
    ret

buildHeap:
    mov eax, [esp + 8] ;#eax = n
    mov ebx, 2
    div ebx
    sub eax, 1 ;#eax =startIdx

    mov ebx, eax ;#i = startid
    for:
        cmp ebx, 0
        jl end_for

        push ebx ;#i

        mov ecx, [esp +8]
        push ecx ;#n

        lea ecx,  [esp +4]
        push ecx ;# arr
        call heapify

        add esp, 12

        dec ebx
        jmp for
    end_for:






    ret

printHeap:
    push	ebp
    push	edi
    push	esi
    push	ebx
    sub	esp, 24
    mov	ebp, DWORD [esp+44]
    mov	edi, DWORD [esp+48]
    push 0x10000000
    call	print_str
    add	esp, 16
    test	edi, edi
    jle	$L14
    mov	esi, ebp
    lea	edi, [ebp+edi*4]
$L15:
    sub	esp, 12
    push	DWORD [esi]
    call	print_int
    mov	DWORD [esp], 32
    call	print_char
    add	esi, 4
    add	esp, 16
    cmp	esi, edi
    jne	$L15
$L14:
    sub	esp, 12
    push	10
    call	print_char
    add	esp, 28
    pop	ebx
    pop	esi
    pop	edi
    pop	ebp
    ret

main:
    push	ebp
    mov	ebp, esp
    push	esi
    push	ebx
    push	ecx
    sub	esp, 68
    mov	ebx, 20
    mov	DWORD [ebp-72], 1
    mov	DWORD [ebp-68], 3
    mov	DWORD [ebp-64], 5
    mov	DWORD [ebp-60], 4
    mov	DWORD [ebp-56], 6
    mov	DWORD [ebp-52], 13
    mov	DWORD [ebp-48], 10
    mov	DWORD [ebp-44], 9
    mov	DWORD [ebp-40], 8
    mov	DWORD [ebp-36], 15
    mov	DWORD [ebp-32], 17
    push	11
    lea	esi, [ebp-72]
    push	esi
    call	buildHeap
    add	esp, 8
    push	11
    push	esi
    call	printHeap
    add	esp, 16
    mov	eax, 0
    lea	esp, [ebp-12]
    pop	ecx
    pop	ebx
    pop	esi
    leave
    ret

print_str:
    mov eax, 4
    mov ebx, dword [esp + 4]
    int 0x80
    ret

print_int:
    mov eax, 1
    mov ebx, dword [esp + 4]
    int 0x80
    ret

print_char:
    mov eax, 11
    mov ebx, dword [esp + 4]
    int 0x80
    ret
