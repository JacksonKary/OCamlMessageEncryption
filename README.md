# **OCamlMessageEncryption**
A fun little project to help teach my friends about binary and how computers store data.

This project encrypts messages into binary representations of ASCII table values.

While this encryption method might be recognizable by a trained programmer, it will appear completely secure to the average person (e.g., teacher, boss, snooping partner).

[**See examples below**](https://github.com/JacksonKary/OCamlMessageEncryption#examples "https://github.com/JacksonKary/OCamlMessageEncryption#examples")

---

## **How to Use**

> **⚠️ Important:**  
> To use this program, you need access to a Linux terminal with an updated version of OCaml (4.08.1), and the `wordToAscii.ml` file.

1. In the Linux terminal, navigate to the directory containing `wordToAscii.ml`.
2. Open the interactive OCaml terminal with the following command:

   ```bash
   utop
   ```

3. To run the program, copy the following command into the terminal:

   ```ocaml
   #use "wordToAscii.ml";;
   ```

   The command line will look like this:  
   ```utop # #use "wordToAscii.ml";;```

4. You're now all set to start encrypting and decrypting messages!

---

## **Encryption Options**

You have two options for encryption:

- **VERSION 1:** `word` (string) -> ASCII values (`int` list)

  **OR**

- **VERSION 2:** `word` (string) -> Binary notation ASCII values (`string` list)

```wordToAscii.ml``` contains four functions: `wta_v1`, `wta_v2`, `atw_v1`, `atw_v2`.

- **"wta"** stands for "word to ASCII" (encryption).
- **"atw"** stands for "ASCII to word" (decryption).

> **Note:** Be sure to match the corresponding versions correctly (`wta_v1` with `atw_v1` **OR** `wta_v2` with `atw_v2`).

In the `utop` terminal, type the name of the function you wish to use, followed by its input:

```ocaml
wta_v1 "message";;
wta_v2 "message";;
atw_v1 [111; 111; 111];;
atw_v2 ["0110 1111"; "0110 1111"; "0110 1111"];;
```

The output of any function can be directly copied and pasted as the input to its corresponding function.

---

## **Examples**

### **Encrypt a message using `wta_v1`:**

**Input:**

```ocaml
wta_v1 "Can we be friends?";;
```

**Output:**

```ocaml
[67; 97; 110; 32; 119; 101; 32; 98; 101; 32; 102; 114; 105; 101; 110; 100; 115; 63]
```

Copy and send the output list.

Upon receiving an encrypted message as an `int` list, decrypt using `atw_v1`:

**Input:**

```ocaml
atw_v1 [67; 97; 110; 32; 119; 101; 32; 98; 101; 32; 102; 114; 105; 101; 110; 100; 115; 63];;
```

**Output:**

```ocaml
"Can we be friends?"
```

---

### **Encrypt a message using `wta_v2`:**

**Input:**

```ocaml
wta_v2 "Can we be friends?";;
```

**Output:**

```ocaml
["0100 0011"; "0110 0001"; "0110 1110"; "0010 0000"; "0111 0111"; "0110 0101"; 
 "0010 0000"; "0110 0010"; "0110 0101"; "0010 0000"; "0110 0110"; "0111 0010"; 
 "0110 1001"; "0110 0101"; "0110 1110"; "0110 0100"; "0111 0011"; "0011 1111"]
```

Copy and send the output list.

Upon receiving an encrypted message as a `string` list, decrypt using `atw_v2`:

**Input:**

```ocaml
atw_v2 ["0100 0011"; "0110 0001"; "0110 1110"; "0010 0000"; "0111 0111"; "0110 0101"; 
        "0010 0000"; "0110 0010"; "0110 0101"; "0010 0000"; "0110 0110"; "0111 0010"; 
        "0110 1001"; "0110 0101"; "0110 1110"; "0110 0100"; "0111 0011"; "0011 1111"];;
```

**Output:**

```ocaml
"Can we be friends?"
```
