rule all:
    input:

rule longest_gene_variant:
    input:
        'data/{sample}.fa'
    shell:
        'for f in {input}; do python ~/anaconda3/pkgs/orthofinder-2.5.4-hdfd78af_0/bin/primary_transcript.py $f ; done'

rule orthofinder:
    input:
        directory(data)
    output:
        'directory(data/primary_transcripts)'
    shell:
        'orthofinder -f {output}'

rule mafft:
    input:

    output:
    shell:

rule fasttree:
    input:
    output:
    shell:

rule motree:
    input:
    output:
    shell:
