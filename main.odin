package main

import "core:fmt"
import "core:strings"

Token :: struct {
  name: string,
  code: int,
  raw_name: string,
  size: int  
}


contains :: proc(src: string, str: string) -> int {
  return strings.index(src, str)
}



lex :: proc(input: string) -> int {
  lexStack: [dynamic]string
  is := strings.split(input, "") 
  // append(&lexStack, is)
  i := 0
  for i < len(input) {
    c := ""
    fmt.println(is[i])
    if contains(is[i], " ") == 0 {
      fmt.println("You have space") 
    } else if contains(is[(len(is) - i) - 1], "write") == 0 {
      fmt.println("You have write!!")
    }    
    append(&lexStack, is[i]) 
    i += 1;
  }
  // fmt.println(lexStack)
  return 0
} 

main :: proc() {
  // fmt.println("Hello World!")
  stack: [dynamic]string
  demo := "write 'Hello World!'"
  append(&stack, demo)
  lex(demo)
}