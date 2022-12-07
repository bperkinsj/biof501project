import os, os.path

def get_orthofinder_results_orthogroups(wildcards):
    return 'data/primary_transcripts/OrthoFinder/Results_orthofinder/Resolved_Gene_Trees/{wildcard}.txt'.format(wildcard=wildcards.orthogroup)

def get_msa_results_orthogroups(wildcards):
    return 'data/primary_transcripts/OrthoFinder/Results_msa/Resolved_Gene_Trees/{wildcard}.txt'.format(wildcard=wildcards.orthogroup)


rule all:
    input:
        'data/figures/Orthofinder_tree.png',
        'data/figures/Msa_tree.png',
        'data/species_comparison_tables/species_tree_comparison.tsv'
        # 'data/gene_comparison_tables/{orthogroup}.tsv'


rule longest_gene_variant:
    output:
        'data/primary_transcripts/'
    shell:
        'for f in data/*.fa; do python ~/anaconda3/pkgs/orthofinder-2.5.4-hdfd78af_0/bin/primary_transcript.py $f ; done'

rule orthofinder_trees:
    input:
        'data/primary_transcripts/'
    output:
        'data/primary_transcripts/OrthoFinder/Results_orthofinder/Species_Tree/SpeciesTree_rooted.txt'
    shell:
        'orthofinder -f {input} -n orthofinder'

rule msa_trees:
    input:
        'data/primary_transcripts/'
    output:
        'data/primary_transcripts/OrthoFinder/Results_msa/Species_Tree/SpeciesTree_rooted.txt'
    shell:
        'orthofinder -f {input} -M msa -n msa'

# rule gene_trees_comparison:
#     input:
#         tree1=get_orthofinder_results_orthogroups,
#         tree2=get_msa_results_orthogroups
#     output:
#         'data/gene_comparison_tables/{orthogroup}.tsv'
#     shell:
#         'CompareTree.pl -tree {input.tree1} -versus {input.tree2} > {output}'

rule species_trees_comparison:
    input:
        tree1='data/primary_transcripts/OrthoFinder/Results_orthofinder/Species_Tree/SpeciesTree_rooted.txt',
        tree2='data/primary_transcripts/OrthoFinder/Results_msa/Species_Tree/SpeciesTree_rooted.txt'
    output:
        'data/species_comparison_table/species_tree_comparison.tsv'
    shell:
        'CompareTree.pl -tree {input.tree1} -versus {input.tree2} > {output}'

rule visualize_species_trees:
    input:
        tree1='data/primary_transcripts/OrthoFinder/Results_orthofinder/Species_Tree/SpeciesTree_rooted.txt',
        tree2='data/primary_transcripts/OrthoFinder/Results_msa/Species_Tree/SpeciesTree_rooted.txt'
    output:
        image1='data/figures/Orthofinder_tree.png',
        image2='data/figures/Msa_tree.png'
    shell:
        'plottree {input.tree1} -o {output.image1}; plottree {input.tree2} -o {output.image2}'