package main

import "core:fmt"
import "core:strings"

Token :: struct {
  name: string,
  code: int,
  raw_name: string,
  size: int  
}

Type :: enum {
  Write,
  Int,
  Quote,
  Space
}

contains :: proc(src: string, str: string) -> int {
  return strings.index(src, str)
}

specify :: proc(is: []string, delimit: string) -> string {
  tStack : [dynamic]string
  spec := is[0:][:len(delimit)]
  sj := strings.join(spec, "")
  ss := strings.split(delimit, "")
  comp := strings.compare(sj, delimit)
  if comp == 0 {
    // fmt.println("There is no match with the following strings")
    append(&tStack, sj)
    return sj
  }
  return sj
}

comp :: proc(com: string, inp: string) -> bool {
  same := strings.compare(com, inp)
  if same != 0 {
    return true
  } else {
    return false
  }

  if len(com) < len(inp) {
    return false
  } else if len(com) > len(inp) {
    return false
  } else {
    return true
  }
  return false
}

lex :: proc(input: string) -> int {
  lexStack: [dynamic]string
  ls: [dynamic]string
  is := strings.split(input, "")
  // append(&lexStack, is) 
  // append(&lexStack, is)
  i := 0
  tok := Token{}
  using Type
  for i < len(is) {
    c := ""
    append(&ls, is[i])
    //fmt.println(strings.join(is[(len(is) -i) - 1]))
    // fmt.println(is[i])
    if contains(is[i], " ") == 0 {
      tok.name = "Space"
      s := Space
      tok.code = int(s)
      tok.raw_name = " "
      tok.size = len(tok.raw_name)
      //fmt.println("You have space")
      // fmt.println(is[0:len("write")])
    } else if comp(strings.join(ls[:], ""), tok.raw_name) {
      tok.name = "Write"
      w := Write
      tok.code = int(w)
      tok.raw_name = "write"
      tok.size = len(tok.raw_name)
      //fmt.println("You have write!!")
      //fmt.println(specify(is, "write"))
    } else {
      tok.name = "Integer Literal"
      ii := Int
      tok.code = int(ii)
      tok.raw_name = is[i]
      tok.size = len(tok.raw_name)
      // fmt.println("All Other Tokens")
      //fmt.println(specify(is, "write"))
    } 
    append(&lexStack, is[i]) 
    fmt.println(tok)
    fmt.println(ls)
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
  lex(pop(&stack))
}