import macros

proc logging_output(s: cstring) {.stdcall importc.}
proc thread_sleep(n: int): int {.stdcall importc.}

var n = 0
var a: array[0..9, int]

proc apimain2 {.cdecl exportc.} =
  while true:
    for i in low(a) .. high(a):
      a[i] = i
    logging_output("log message from nim")
    discard thread_sleep(1000)
