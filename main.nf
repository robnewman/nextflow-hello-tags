#!/usr/bin/env nextflow

process sayHello {

  publishDir '/pipelines/data/chunks', tags: [ FOO: 'Hello world']

  input: 
    val x
  output:
    path 'chunk_*'
  script:
    """
    printf '$x world!' | split -b 1 - chunk_
    """
}

workflow {
  Channel.of('Bonjour', 'Ciao', 'Hello', 'Hola') | sayHello | view
}
