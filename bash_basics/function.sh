greeting () {
  echo Hello $1. This is the 'greeting' method.
}

greeting_2 () {
  echo Hello $1 $2. This is the 'greeting_2' method.
}

greeting 'Peter' # outputs 'Hello Peter'
greeting_2 'Peter' 'Paul'