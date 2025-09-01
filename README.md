# tempconv8085
A simple temperature converter in 8085 assembly environmment . 
Basic Implementation of 8085 assembly . 
It does not handle negative values .


The code was performed in 8085 simulator (https://www.sim8085.com)
You have to manually put data in IN port by going into the 'I/O ports' section 
. The data storage for register pairs and flag status can be seen in 'CPU' section 


used : 

 LXI  was used to access a memory address to store 8-bit data  
 
 MVI was used to store an imediate 8-bit value to 'recent' memory 
 
 MOV moves data from source to destination
 
  destination is defined first and then comes the source 
  
    ( MOV A, B) here A is destination and B is source
    
 INR increments value by 1 of specified register
 
 DCR decrements value by 1 of specified register 

 ADD adds specified register with value in accumulator 

 SUI subtracts an imediate value with the value in accumulator 

 CPI compares the immediate value with the accumulator , flags are affected 

 MUL_LOO, MUL_NC,DIV_LOOP,DO_SUB,NO_BORROW,DIV_DONE are all labels which are used by Jump  statements 

 Jump statements:
 
 JC : Jumps to the address if carry flag is 1	
 
 JNC : Jumps to the address if carry flag is 0

 JNZ : Jumps to the address if zero flag is 0

 



IN/OUT was used to access input and output port respectively 
as of now the value of IN port is '00h' and OUT port is '02H'
  both of which can be changed ' refer to 'I/O ports section for available ports 

HLT : idk works like getch() in c 





ASSEMBLY WORKING :
The INPUT AND OUTPUT PORT have values in HEXADECIMAL

*!* Example Conversions  
|Input (Fahrenheit) | CalCUlation                 | Output (celsius)|
|-------------------|-----------------------------|-----------------|
|     35°F (`23H`)  |(35 - 32) × 5 / 9 = 15 / 9   |    1°C (`01H`)  |
|     41°F (`29H`)  |(41 - 32) × 5 / 9 = 45 / 9   |    5°C (`05H`)  |
|    100°F (`64H`)  |(100 - 32) × 5 / 9 = 340 / 9 |    37°C (`25H`) |


Works with 8-bit Fahrenheit ('00H'-'FFH')

1.Input 
  - Fahrenheit value is read from input port '00H'

2. Subtract 32
   - '(F-32)' is stored in a register .

3. Multiply by 5
  - Loop to repeatedly add '(F-32)'  5 times into 16-bit register pair.

4. Divide by 9
  -The intermediate result is divide by '9' using repeated subtractionn
  -The quotient (integer Celsius ) is stored in a register.

5. Output
 - Celsius result is sent to output port '02H'





