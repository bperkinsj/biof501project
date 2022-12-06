rule all:
    input:
        'directory(data/FASTTREE_trees)'

rule longest_gene_variant:
    input:
        'data/{species}.fa'
    output:
        'data/primary_transcripts/{species}.fa'
    shell:
        'for f in {input}; do python ~/anaconda3/pkgs/orthofinder-2.5.4-hdfd78af_0/bin/primary_transcript.py $f ; done'

rule orthofinder:
    input:
        'directory(data/primary_transcripts)'
    shell:
        'orthofinder -f {input}'

rule mafft:
    input:
        'data/Results_*/Single_Copy_Orthologue_Sequences/{orthogroup}.fa'
    output:
        'data/MAFFT_alignments/{orthogroup}.fa'
    shell:
        'for i in {1..100}; do mafft {input} > {output}; done'

rule fasttree:
    input:
        'data/MAFFT_alignments/{orthogroup}.fa'
    output:
        'data/FASTTREE_trees/{orthogroup}.tree'
    shell:
        'FastTree < {input} > {output}'

rule motree:
    input:
        tree1='data/FASTTREE_trees/{orthogroup}.tree',
        tree2='data/Results_*/Resolved_Gene_Trees/{orthogroup}.txt'
    output:
        'data/comparison_tables/{orthogroup}.tsv'
    shell:
        'CompareTree.pl -tree {input.tree1} -versus {input.tree2} > {output}'