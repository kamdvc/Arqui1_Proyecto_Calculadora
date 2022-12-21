[PROJECT ASSEMBLER CALCULADORA EMANUEL GARCÍA.pdf](https://github.com/kamdvc/Arqui1_Proyecto_Calculadora/files/10274094/PROJECT.ASSEMBLER.CALCULADORA.EMANUEL.GARCIA.pdf)
# Arqui1_Proyecto_Calculadora

Welcome to the calculator in assembler

enter the following link

https://www.tutorialspoint.com/compile_assembly_online.php

copy and paste the code on the page

click on execute

When executing the program, the following menu will appear

![Imagen1](https://user-images.githubusercontent.com/119770780/208806097-554db141-8dc8-4ec2-be63-d5be75199d4f.png)

We begin with the execution of the program where the menu of options that the calculator has with its respective operations is shown, which are: addition, subtraction, multiplication, division, power.
In order to display the menu
We define a variable of global type, we call the _start tag that starts the service

![Imagen2](https://user-images.githubusercontent.com/119770780/208806263-60ae7bea-20e3-4f8a-a2a3-0121666ec7dd.png)

Within this label we call the variable "msg" found in the .data section, where the constants are and all the menu information with their respective options. So we also call the variable "len" that gives us the length of the message. We use system write or its equivalent = 4 to write the message.
Then we close the connection by calling interrupt 0x80= SYS_INIT_MODULE

![Imagen3](https://user-images.githubusercontent.com/119770780/208806339-bb421e89-d584-4b22-9ee5-457a68951526.png)

For the user to be able to use the calculator he must enter a valid number of the operation to perform, we read the data using SYS_READ= 3 moving the value to eax, then saving the user data in a one-byte reserved variable called: buf, which is found inside the .bss section

![Imagen4](https://user-images.githubusercontent.com/119770780/208806399-5ea2a490-094f-4572-8763-3a714bb6d170.png)

We do the buf comparison of the number entered by the user and if one of them corresponds to a function then we proceed to tell it to jump to that function

![Imagen5](https://user-images.githubusercontent.com/119770780/208806481-978c0a72-d52f-4f7d-86e7-fff1c02099bd.png)

Entering the number "1" will enter the add function, after having stored the value in the variable buf and compare it with 1. Using Conditional Jump that is equal to option add jump if it is equal to option 1. Once inside the sum function as we have the data burned, we move to the eax register the value that we want to perform the sum function and ebx. To add both values we use “add” that adds the values of the eax and ebx registers
We use aam and add eax, 3030h to convert from ascii to decimal
The esp information is saved in ebp, we subtract 2 spaces from esp with “sub esp, 2” on the stack to be able to enter the values we need it to display. We push the first value to register ah on the stack mov [esp], byte ah, then the second value mov [esp+1], byte to register al. We move esp to ecx, using mov edx, 2 we create the 2-byte space to display the result of the operation. We use system write or its equivalent = 4 to write the message, in this case the result.
Then we close the connection by calling the interrupt 0x80= SYS_INIT_MODULE, after displaying the result using jmp _start it returns to the menu again to be able to continue with some other operation that the user wants to perform or exit

![Imagen6](https://user-images.githubusercontent.com/119770780/208806608-1a608d11-0689-46f8-a2d6-971ca9f322ef.png)

Entering the number "2" will enter the subtraction function, after having stored the value in the variable buf and compare it with 2. Using Conditional Jump that is equal to option add jump if it is equal to option 1. Once inside the subtraction function as we have the data burned, we move to the eax register the value that we want to carry out the subtraction function and ebx. To subtract both values we use "sub" that adds the values of the eax and ebx registers
We use aam and add eax, 3030h to convert from ascii to decimal
The esp information is saved in ebp, we subtract 2 spaces from esp with “sub esp, 2” on the stack to be able to enter the values we need it to display. We push the first value to register ah on the stack mov [esp], byte ah, then the second value mov [esp+1], byte to register al. We move esp to ecx, using mov edx, 2 we create the 2-byte space to display the result of the operation. We use system write or its equivalent = 4 to write the message, in this case the result.
Then we close the connection by calling the interrupt 0x80= SYS_INIT_MODULE, after displaying the result using jmp _start it returns to the menu again to be able to continue with some other operation that the user wants to perform or exit 

![Imagen7](https://user-images.githubusercontent.com/119770780/208806689-02c56a00-0d65-4d96-86ae-f6c68c9a2fa2.png)

Entering the number "3" will enter the multiplication function, after having stored the value in the variable buf and compare it with 3. Using Conditional Jump that is equal to option multiplication jump if it is equal to option 3. Once inside the multiplication function as we have the data burned, we move to the eax register the value that we want to carry out the subtraction and ebx function. To multiply both values we use "mul" which adds the values of the eax and ebx registers
We use aam and add eax, 3030h to convert from ascii to decimal
The esp information is saved in ebp, we subtract 2 spaces from esp with “sub esp, 2” on the stack to be able to enter the values we need it to display. We push the first value to register ah on the stack mov [esp], byte ah, then the second value mov [esp+1], byte to register al. We move esp to ecx, using mov edx, 2 we create the 2-byte space to display the result of the operation. We use system write or its equivalent = 4 to write the message, in this case the result.
Then we close the connection by calling the interrupt 0x80= SYS_INIT_MODULE, after displaying the result using jmp _start it returns to the menu again to be able to continue with some other operation that the user wants to perform or exit

![Imagen8](https://user-images.githubusercontent.com/119770780/208806781-10f918d2-49b2-40df-9fd3-df6614c52025.png)

Entering the number "4" will enter the division function, after having stored the value in the variable buf and compare it with 4. Using Conditional Jump that is equal to option multiplication jump if it is equal to option 4. Once inside the division function as we have the data burned, we move to the eax register the value that we want to carry out the subtraction and ebx function. To multiply both values we use "mul" which adds the values of the eax and ebx registers
We use aam and add eax, 3030h to convert from ascii to decimal
The esp information is saved in ebp, we subtract 2 spaces from esp with “sub esp, 2” on the stack to be able to enter the values we need it to display. We push the first value to register ah on the stack mov [esp], byte ah, then the second value mov [esp+1], byte to register al. We move esp to ecx, using mov edx, 2 we create the 2-byte space to display the result of the operation. We use system write or its equivalent = 4 to write the message, in this case the result.
Then we close the connection by calling the interrupt 0x80= SYS_INIT_MODULE, after displaying the result using jmp _start it returns to the menu again to be able to continue with some other operation that the user wants to perform or exit 

![Imagen9](https://user-images.githubusercontent.com/119770780/208806843-5fc0c7b5-f8df-414b-b003-dd237e2ff40e.png)

Entering the number "5" will enter the multiplication function, after having stored the value in the variable buf and compare it with 5. Using Conditional Jump that is equal to option multiplication jump if it is equal to option 5. Once inside the power function as we have the data burned in the _start function

![Imagen10](https://user-images.githubusercontent.com/119770780/208807081-7821fdb5-328d-45b7-96a3-73bb0ee080bd.png)

Add to esi itself, then decrement ecx, compare ecx to 0 and if it's not 0 then jump greater to the power label until it's 0, use aam and add eax, 3030h to convert from ascii to decimal
The esp information is saved in ebp, we subtract 2 spaces from esp with “sub esp, 2” on the stack to be able to enter the values we need it to display. We push the first value to register ah on the stack mov [esp], byte ah, then the second value mov [esp+1], byte to register al. We move esp to ecx, using mov edx, 2 we create the 2-byte space to display the result of the operation. We use system write or its equivalent = 4 to write the message, in this case the result.
Then we close the connection by calling the interrupt 0x80= SYS_INIT_MODULE, after displaying the result using jmp _start it returns to the menu again to be able to continue with some other operation that the user wants to perform or exit 

![Imagen11](https://user-images.githubusercontent.com/119770780/208807180-91d83bf2-f903-45c6-9dc4-55b7af87f818.png)

Entering the number "6" will enter the exit function, after having stored the value in the variable buf and compare it with 6. Using Conditional Jump that is equal to option exit jump if equal to option 6. Once inside the exit function, we call the variable "msg4" found in the .data section, where the constants are and the message: "10" is found, to show a blank space, thus concluding the program. So we also call the variable "len4" that gives us the length of the message. We use system write or its equivalent= 4 to write the message, then close the connection by calling interrupt 0x80= SYS_INIT_MODULE 

![Imagen12](https://user-images.githubusercontent.com/119770780/208807280-79d6978d-9794-4bc3-8142-23c4a3a6964b.png)

 If the user enters an incorrect option within the menu. We call the variable "msg5" found in the .data section, where the constants are and the message: "Option not valid!". So we also call the variable "len5" that gives us the length of the message. We use system write or its equivalent = 4 to write the message.
Then we close the connection by calling the interrupt 0x80= SYS_INIT_MODULE, we use system write or its equivalent= 4 to write the message in this case invalid option.
Then we close the connection by calling the interrupt 0x80= SYS_INIT_MODULE, after displaying the message invalid option, using jmp _start it returns to the menu again to be able to continue with some other operation that the user wants to perform or exit

![Imagen13](https://user-images.githubusercontent.com/119770780/208807607-5a5149f0-c61b-4519-8d21-2dd0246de7fb.png)
