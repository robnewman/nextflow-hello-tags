#!/usr/bin/env nextflow

process sayHello {

  publishDir 's3://robnewman-dataexplorer-ireland/data/pipelines/chunks', mode: 'copy', overwrite: false, tags: [FOO: 'Hello world']

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
