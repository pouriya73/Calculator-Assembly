.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'Add number  :'1'$'
MSG2 DB 10,13,'Sub number  :'2'$'
MSG3 DB 10,13,'multiplied number   :'3'$'
MSG4 DB 10,13,'divided number   :'4'$'
MSG5 DB 10,13,'Press between 1 to 4:$'
MSG6 DB 10,13,10,13,'Enter First Number:$'
MSG7 DB 10,13,'Enter Second Number:$'
MSG8 DB 10,13,10,13,'Calculate  :$' 
MSG DB 10,13,10,13,'$'
            
NUM1 DB ?
NUM2 DB ?
RESULT DB ?
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H

    LEA DX,MSG2
    MOV AH,9
    INT 21H

    LEA DX,MSG3
    MOV AH,9
    INT 21H

    LEA DX,MSG4
    MOV AH,9
    INT 21H 
    
    LEA DX,MSG5
    MOV AH,9
    INT 21H

    MOV AH,1
    INT 21H
    MOV BH,AL
    SUB BH,48
    
    CMP BH,1
    JE ADD
    
    CMP BH,2
    JE SUB
     
    CMP BH,3
    JE MUL
    
    CMP BH,4
    JE DIV
    
    
      ADD:
    LEA DX,MSG6  ;ENTER 1ST NUMBER
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    LEA DX,MSG7    ;ENTER 2ND NUMBER
    MOV AH,9
    INT 21H 
    
   
