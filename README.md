# OCamlMessageEncryption
Encrypts messages into binary representations of Ascii table values.

This encryption method might be recognizable by a trained programmer's eye, 
but to the average person (teacher, boss, snooping partner, etc), your messages will be completely secure.

[See examples below](https://github.com/JacksonKary/OCamlMessageEncryption#examples "https://github.com/JacksonKary/OCamlMessageEncryption#examples")

## How to use

To use this program, one needs access to a linux terminal with an updated version of OCaml (4.08.1), and the wordToAscii.ml file.

First, in the linux terminal, ensure you're in the directory containing 'wordToAscii.ml'.
Then, open the interactive OCaml terminal with the following command:
```
utop
```
Now, to run the program, copy the following command into the terminal:
```
#use "wordToAscii.ml";;
```
The command line will look like ```utop # #use "wordToAscii copy.ml";;```

Everything is now set up to start encrypting and decrypting messages!
<br />
<br />
## There are two options for encryption

VERSION 1: word (string) -> ascii values (int list)

```OR``` 

VERSION 2: word (string) -> binary notation ascii values (string list)
<br />

```wordToAscii.ml contains four functions: wta_v1, wta_v2, atw_v1, atw_v2```

"wta" stands for "word to ascii" and encrypts messages.

"atw" stands for "ascii to word" and decrypts messages.

Just be sure to match the versions correctly.

In the utop terminal, simply type the name of the function you wish to use, followed by its input:

```
wta_v1 "message";;
```
```
wta_v2 "message";;
```
```
atw_v1 [111; 111; 111];;
```
```
atw_v2 ["0110 1111"; "0110 1111"; "0110 1111"];;
```

The output of any function can be directly copied and pasted as the input to its corresponding function.
<br />
<br />
## EXAMPLES

### Encrypt a message using wta_v1:

input:
```wta_v1 "Can we be friends?";;```

output:
```[67; 97; 110; 32; 119; 101; 32; 98; 101; 32; 102; 114; 105; 101; 110; 100; 115; 63]```

Copy and send the output list.

Upon receiving an encrypted message as an int list, decrypt using atw_v1:

input:
```atw_v1 [67; 97; 110; 32; 119; 101; 32; 98; 101; 32; 102; 114; 105; 101; 110; 100; 115; 63];;```

output:
```"Can we be friends?"```

### Encrypt a message using wta_v2:

input: 
```wta_v2 "Can we be friends?";;```

output:
```
["0100 0011"; "0110 0001"; "0110 1110"; "0010 0000"; "0111 0111"; "0110 0101"; "0010 0000"; "0110 0010"; "0110 0101";
"0010 0000"; "0110 0110"; "0111 0010"; "0110 1001"; "0110 0101"; "0110 1110"; "0110 0100"; "0111 0011"; "0011 1111"]
```

Copy and send the output list.

Upon receiving an ecrypted message as a string list, decrypt using atw_v2:

input:
```
atw_v2 ["0100 0011"; "0110 0001"; "0110 1110"; "0010 0000"; "0111 0111"; "0110 0101";
 "0010 0000"; "0110 0010"; "0110 0101"; "0010 0000"; "0110 0110"; "0111 0010";
 "0110 1001"; "0110 0101"; "0110 1110"; "0110 0100"; "0111 0011"; "0011 1111"];;
```

output:
``` "Can we be friends?" ```
 
