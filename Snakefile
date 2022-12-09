rule all:
    input:
        'data/figures/Orthofinder_tree.png',
        'data/figures/Msa_tree.png',
        'data/comparison_table/species_tree_comparison.tsv'


rule longest_gene_variant:
    output:
        'data/primary_transcripts/'
    shell:
        'for f in data/*.fa; do python tools/primary_transcripts.py $f ; done'

rule orthofinder_trees:
    input:
        'data/primary_transcripts/'
    output:
        'data/primary_transcripts/OrthoFinder/Results_orthofinder/Species_Tree/SpeciesTree_rooted.txt'
    shell:
        'rm -rf data/primary_transcripts/OrthoFinder/Results_orthofinder ; orthofinder -f {input} -n orthofinder'

rule msa_trees:
    input:
        'data/primary_transcripts/'
    output:
        'data/primary_transcripts/OrthoFinder/Results_msa/Species_Tree/SpeciesTree_rooted.txt'
    shell:
        'rm -rf data/primary_transcripts/OrthoFinder/Results_msa ; orthofinder -f {input} -M msa -n msa'

rule species_trees_comparison:
    input:
        tree1='data/primary_transcripts/OrthoFinder/Results_orthofinder/Species_Tree/SpeciesTree_rooted.txt',
        tree2='data/primary_transcripts/OrthoFinder/Results_msa/Species_Tree/SpeciesTree_rooted.txt'
    output:
        'data/comparison_table/species_tree_comparison.tsv'
    shell:
        'perl -I MOTreeComparison/ MOTreeComparison/CompareTree.pl -tree {input.tree1} -versus {input.tree2} > {output}'

rule visualize_species_trees:
    input:
        tree1='data/primary_transcripts/OrthoFinder/Results_orthofinder/Species_Tree/SpeciesTree_rooted.txt',
        tree2='data/primary_transcripts/OrthoFinder/Results_msa/Species_Tree/SpeciesTree_rooted.txt'
    output:
        image1='data/figures/Orthofinder_tree.png',
        image2='data/figures/Msa_tree.png'
    shell:
        'plottree {input.tree1} -o {output.image1}; plottree {input.tree2} -o {output.image2}'