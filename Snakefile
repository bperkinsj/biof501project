rule all:
    input:

rule longest_gene_variant:
    input:
        'data/{sample}.fa'
    shell:
        'for f in {input}; do python ~/anaconda3/pkgs/orthofinder-2.5.4-hdfd78af_0/bin/primary_transcript.py $f ; done'

rule orthofinder:
    output:
        'directory(data/primary_transcripts)'
    shell:
        'orthofinder -f {output}'

rule mafft:
    input:
        'data/Results_{date}/Single_Copy_Orthologue_Sequences/{orthogroup}.fa'
    output:
        'data/MAFFT_alignments/{orthogroup}.fa'
    shell:
        'for i in {1..100}; do mafft {input} > {output}; done'

rule fasttree:
    input:
    output:
    shell:

rule motree:
    input:
    output:
    shell:
