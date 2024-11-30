; IPP Automation: Assign Node Webs to Registers, Group into Clusters, and Banks

; Step 1: Assign Node Webs to Registers
MOV AX, Node_Web_Terms       ; Load Terms Node Web into AX register
MOV BX, Node_Web_Types       ; Load Types Node Web into BX register
MOV CX, Node_Web_Variables   ; Load Variables Node Web into CX register
MOV DX, Node_Web_Values      ; Load Values Node Web into DX register
MOV EX, Node_Web_Tokens      ; Load Tokens Node Web into EX register

; Step 2: Group Registers into Clusters
; Syntax Cluster
PUSH AX                      ; Push Syntax Register AX onto the stack
PUSH EX                      ; Push Syntax Register EX onto the stack

; Data Cluster
PUSH BX                      ; Push Data Register BX onto the stack
PUSH CX                      ; Push Data Register CX onto the stack
PUSH DX                      ; Push Data Register DX onto the stack

; Step 3: Group Clusters into Banks
; Syntax Bank
MOV SI, Syntax_Cluster       ; Point SI to Syntax Cluster
MOV [Syntax_Bank], SI        ; Add Syntax Cluster to Syntax Bank

; Data Bank
MOV DI, Data_Cluster         ; Point DI to Data Cluster
MOV [Data_Bank], DI          ; Add Data Cluster to Data Bank

; End of IPP setup
HLT                          ; Halt execution
