#!/usr/bin/env nextflow

process sayHello {

  publishDir tags: [ FOO: 'Hello world']

  input: 
    val x
  output:
    stdout
  script:
    """
    echo '$x world!'
    """
}

workflow {
  Channel.of('Bonjour', 'Ciao', 'Hello', 'Hola') | sayHello | view
}
