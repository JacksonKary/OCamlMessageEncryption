(* wta_v1 -- "word to ascii" version 1
   This function takes in a word as a string and returns an int list of 
   ascii values for each letter in the word.*)
let wta_v1 (str: string) : int list =
  let rec list_char (word: string) : char list =
    match word with
    | "" -> []
    | word -> (String.get word 0) :: (list_char (String.sub word 1 ((String.length word)-1) ) )
  in
  let rec char_int (chars: char list) : int list =
    match chars with
    | [] -> []
    | x::xs -> Char.code x :: char_int(xs)
  in 
  char_int (list_char (str))

(* wta_v2 -- "word to ascii" version 2
   This version also takes in a string (the message you want to encrypt), but it returns a string list (the encrypted message in binary notation).

   It first converts the string into a list of characters in list_char. 
   From there, char_int finds the ascii value of each character and puts them in a list.
   Finally, int_binary calls func to create a string list of binary representations - this is the final output.
*)
let wta_v2 (str: string) : string list =
  let rec list_char (word: string) : char list =
    match word with
    | "" -> []
    | word -> (String.get word 0) :: (list_char (String.sub word 1 ((String.length word)-1) ) )
  in
  let rec char_int (chars: char list) : int list =
    match chars with
    | [] -> []
    | x::xs -> Char.code x :: char_int(xs)
  in 
  let rec func (n: int) (bits_so_far: string) : string = 
    match n with
        | n when n >= 128 -> func (n-128) ("1" ^ (String.sub bits_so_far 1 8))
        | n when n >= 64 -> func (n-64) ((String.sub bits_so_far 0 1) ^ "1" ^ (String.sub bits_so_far 2 7))
        | n when n >= 32 -> func (n-32) ((String.sub bits_so_far 0 2) ^ "1" ^ (String.sub bits_so_far 3 6))
        | n when n >= 16 -> func (n-16) ((String.sub bits_so_far 0 3) ^ "1" ^ (String.sub bits_so_far 4 5))
        | n when n >= 8 -> func (n-8) ((String.sub bits_so_far 0 5) ^ "1" ^ (String.sub bits_so_far 6 3))
        | n when n >= 4 -> func (n-4) ((String.sub bits_so_far 0 6) ^ "1" ^ (String.sub bits_so_far 7 2))
        | n when n >= 2 -> func (n-2) ((String.sub bits_so_far 0 7) ^ "1" ^ (String.sub bits_so_far 8 1))
        | n when n >= 1 -> func (n-1) ((String.sub bits_so_far 0 8) ^ "1")
        | n -> bits_so_far
  in
  let rec int_binary (ints: int list) : string list= 
    match ints with
    | [] -> []
    | x::xs -> func x "0000 0000" :: int_binary xs
  in
  int_binary(char_int(list_char(str)))

(* atw_v1 -- "ascii to word version 1" decrypts message encrypted by wta_v1 *)
let atw_v1 (ints: int list) : string =
  let rec int_list_to_char_list (nts: int list) : char list =
    match nts with
    | [] -> []
    | x::xs -> Char.chr x :: int_list_to_char_list xs
  in 
  let char_list_to_string (chrs: char list) : string =
    match chrs with
    | [] -> ""
    | chrs -> String.concat "" (List.map (String.make 1) chrs)
  in 
  char_list_to_string(int_list_to_char_list(ints))
  
(* atw_v2 -- "ascii to word version 2" decrypts message encrypted by wta_v2 *)
let atw_v2 (strs: string list) : string = 
  let rec defunc (bits: string) (acc: int) (inc: int): int =
    match bits with
    | "" -> acc
    | bits when String.get bits 0 == '1' -> defunc (String.sub bits 1 ((String.length bits)-1)) (acc + inc) (Int.div inc 2)
    | bits when String.get bits 0 == ' ' -> defunc (String.sub bits 1 ((String.length bits)-1)) (acc) (inc)
    | bits when String.get bits 0 == '0' -> defunc (String.sub bits 1 ((String.length bits)-1)) (acc) (Int.div inc 2)
    | bits -> acc
  in 
  let rec construct_int_list (strl: string list) : int list =
    match strl with
    | [] -> []
    | x::xs -> defunc x 0 128 :: construct_int_list xs
  in 
  let rec int_list_to_char_list (ints: int list) : char list =
    match ints with
    | [] -> []
    | x::xs -> Char.chr x :: int_list_to_char_list xs
  in 
  let char_list_to_string (chrs: char list) : string =
    match chrs with
    | [] -> ""
    | chrs -> String.concat "" (List.map (String.make 1) chrs)
  in 
  char_list_to_string(int_list_to_char_list(construct_int_list(strs)))
