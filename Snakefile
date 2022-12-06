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

rule orthofinder_trees:
    input:
        'directory(data/primary_transcripts)'
    shell:
        'orthofinder -f {input} -n orthofinder'

rule msa_trees:
    input:
        'directory(data/primary_transcripts)'
    shell:
        'orthofinder -f {input} -M msa -n msa'

rule gene_trees_comparison:
    input:
        tree1='data/primary_transcripts/OrthoFinder/Results_orthofinder/Resolved_Gene_Trees/{orthogroup}.txt',
        tree2='data/primary_transcripts/OrthoFinder/Results_msa/Resolved_Gene_Trees/{orthogroup}.txt'
    output:
        'data/comparison_tables/{orthogroup}.tsv'
    shell:
        'CompareTree.pl -tree {input.tree1} -versus {input.tree2} > {output}'

rule species_trees_comparison:
    input:
        tree1='data/primary_transcripts/OrthoFinder/Results_orthofinder/Species_Tree/SpeciesTree_rooted.txt'
        tree2='data/primary_transcripts/OrthoFinder/Results_msa/Species_Tree/SpeciesTree_rooted.txt'
    output:
        'data/comparison_tables/species_tree_comparison.tsv'
    shell:
        'CompareTree.pl -tree {input.tree1} -versus {input.tree2} > {output}'