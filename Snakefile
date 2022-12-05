rule all:
    input:

rule longest_gene_variant:
    input:
        'data/{sample}.faa'
    output:
        'data/{sample}.fa'
    shell:
        'for f in *faa; do python ~/anaconda3/pkgs/orthofinder-2.5.4-hdfd78af_0/bin/primary_transcript.py $f ; done'

rule orthofinder:
    input: