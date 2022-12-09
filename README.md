# BIOF501 Term Project: Generating the (Partial) Avian Phylogenetic Tree

### _By Brooks Perkins-Jechow_

___ 
## Repository Contents

### Directories

- data: contains the protein sequence files for the species of interest (see [below](#species-of-interest)). It will also contain the results files when the pipeline has finished runnning.

- MOTReeComparison: contains the files necessary to run the MOTreeComparison tool.

- tools: contains a python script from Orthofinder that selects for only the longest transcript variant per gene from our species files. This lowers the time needed to run the analysis and also raises the accuracy.

### Files

- dag.svg: a directed acyclic graph (DAG) (aka a diagram) of the workflow. Can be viewed in browser.

- Snakefile: Snakemake instructions to run the pipeline.

## Overview

Birds are a very diverse group. To be precise, they are the most species-rich lineage of all tetrapod vertebrates [[1]](#references), and among these species is an extraordinary range of physical characteristics and abilities. Hummingbirds have heart rates that can vary from 1000 bpm when excited to 50 bpm when at rest. Owls have eyes so large that they cannot turn them in their sockets, and must instead rotate their heads up to 270 degrees. Arctic terns migrate 70,900 km per year in their trips from their breeding grounds in Iceland and Greenland to their wintering grounds in Antarctica and back. These varied capabilities imply an equally varied genetic makeup, a makeup which already informs our understanding of fields such as neuroscience, developmental biology, and immunology [[2]](#references)[[3]](#references)[[4]](#references).

This genetic variety also makes resolving the avian evolutionary tree an exceedingly difficult task. Pinning down the phylogenetic placement of one bird, the hoatzin, has been so difficult that it seems to be a running joke to describe it as "enigmatic" [[6]](#references)[[7]](#references)[[8]](#references). Other attempts at determining the relationships between species or families have ended with bemusingly different results [[4.01]](#references)[[4.1]](#references)[[5]](#references). Perhaps the most ambitious of these is the Bird 10K project, which, as its name implies, seeks to "generate draft genome sequences for about 10,500 extant bird species" [[8.1]](#references). The project started with a genome-scale analysis of 48 species representing every neoavian order, released in 2014, and reached its second goal of 363 genomes from 92.4% of bird families in 2020 [[8.2]](#references)[[8.3]](#references). This project may represent the best chance at fully characterizing the avian phylogenetic tree, though the computing power necessary for it will be staggering [[8.2]](#references)


After the original Orthofinder algorithm 

Hoatzin articles
- https://www.nature.com/articles/nature15697.epdf?referrer_access_token=dYPS_vdiSrZCn0QIpkrrotRgN0jAjWel9jnR3ZoTv0M2DJlqpbYXUSzXrY3ePCj9lli0g-87ASrwV9zCmuRb-yBSwhk2MbGjYN4LSqqo508IuixYv2ArUPwmjVeCUtxJqcH3bn53gAq6_baELEjd8dj8SuLpQ-ryl4wzQpWbHwucgGZzCtaabnQf9Xcb8LM9ZmAgvpl5vaeA-bGP702OuunbFOnFwQc46HkRTtQ_hEY%3D&tracking_referrer=arstechnica.com
- https://pubmed.ncbi.nlm.nih.gov/10486983/
- https://www.ncbi.nlm.nih.gov/pmc/articles/PMC40462/

### Species of interest

Species selected based on the IOC World Bird List Version 12.2 

Common name, species name (order, infraclass)

Little spotted kiwi, _Apteryx owenii_ (Apterygiformes, Galeoagnathae)

Helmeted guineafowl, _Numida meleagris_ (Galliformes, Galloanseres)

Budgerigar, _Melopsittacus undulatus_ (Psittaciformes, Neoaves)

Collared flycatcher, _Ficedula albicollis_ (Passeriformes, Neoaves)

Spoon-billed sandpiper, _Calidris pygmaea_ (Charadriiformes, Neoaves)

Burrowing owl, _Athene cunicularia_ (Strigiformes, Neoaves)


## Dependencies and versions

Python=3.6.15

Diamond=2.0.15

Snakemake=3.13.3

FastTree=2.1.11

MAFFT=7.508

Orthofinder=2.5.4

Perl=5.32.1

Plottree=0.0.2

BioPython=1.79

Graphviz=0.19.1

## Installation

 At the time of writing the pipeline, conda had a bug that prevented creating an environment.yml file. You can follow the steps below to set up the environment with all the requisite packages.

```
conda deactivate

conda create -n brooksenv

conda activate brooksenv

conda install -c bioconda snakemake=3.13.3

conda install -c bioconda orthofinder=2.5.4

pip install plottree

pip install graphviz
```

Check that your package versions match those given above. It's important that you install snakemake version 3.13.3 first as it should install the appropriate Python version.

```
conda install -c bioconda diamond=2.0.15
```

Then start the snakemake pipeline as above.

```
snakemake --cores
```

## Results

The message produced by CompareTree in the terminal should look like this:

```
Splits  Found   1       Total   3       Frac    0.3333  MaxLnDf 0.00672 Ratio   1.4     MaxBtDf 0.692
```

## References

Orthofinder: Emms D.M. & Kelly S. (2019), Genome Biology 20:238

Orthofinder species tree: Emms D.M. & Kelly S. (2017), MBE 34(12): 3267-3278
 Emms D.M. & Kelly S. (2018), bioRxiv https://doi.org/10.1101/267914

[1] F. Gill, D. Donsker, [IOC World Bird List](https://library.wur.nl/WebQuery/recommendeddb/find/2300064) (version 11.1) (2021)

[2] Zeigler, H. P., & Marler, P. (Eds.), [Behavioral neurobiology of birdsong](https://psycnet.apa.org/record/2004-16790-000), New York Academy of Sciences (2004)

[3] A. J. Stattersfield, M. J. Crosby, A. J. Long, D. C. Wege, [Endemic Bird Areas of the World: Priorities for Conservation](https://cir.nii.ac.jp/crid/1573105975027777280). BirdLife Conservation (BirdLife International, Cambridge, UK, 1998). Paper links: [Gene trees and species trees are not the same](https://www.cell.com/trends/ecology-evolution/fulltext/S0169-5347(01)02203-0)

[4] Susan M. Haig, Whitcomb M. Bronaugh, Rachel S. Crowhurst, Jesse D'Elia, Collin A. Eagles-Smith, Clinton W. Epps, Brian Knaus, Mark P. Miller, Michael L. Moses, Sara Oyler-McCance, W. Douglas Robinson, Brian Sidlauskas, Genetic Applications in Avian Conservation, The Auk, Volume 128, Issue 2, 1 April 2011, Pages 205–229, https://doi.org/10.1525/auk.2011.128.2.205

[4.01] Hackett, S.J. et al. A Phylogenomic Study of Birds Reveals Their Evolutionary History. Science 320, 1763-1768 (2008). DOI: [10.1126/science.1157704](https://www.science.org/doi/10.1126/science.1157704)

[4.1] Prum, R., Berv, J., Dornburg, A. et al. A comprehensive phylogeny of birds (Aves) using targeted next-generation DNA sequencing. Nature 526, 569–573 (2015). https://doi.org/10.1038/nature15697

[5] Lewis, Dyani. "67 million-year-old fossil upends bird evolutionary tree." _Nature_, 30 Nov. 2022, https://www.nature.com/articles/s41586-022-05445-y. Accessed 07 Dec. 2022

[6] Crair, Ben. "The Bizarre Bird that's Breaking the Tree of Life." _The New Yorker_, 15 Jul. 2022, https://www.newyorker.com/science/elements/the-bizarre-bird-thats-breaking-the-tree-of-life. Accessed 07 Dec. 2022

[7] Hughes, JM, and Baker, AJ, [Phylogenetic relationships of the enigmatic hoatzin (Opisthocomus hoazin) resolved using mitochondrial and nuclear gene sequences](https://pubmed.ncbi.nlm.nih.gov/10486983/), Mol Biol Evol. 1999 Sep;16(9):1300-7. doi: 10.1093/oxfordjournals.molbev.a026220.

[8] Hedges SB, Simmons MD, van Dijk MA, Caspers GJ, de Jong WW, Sibley CG. [Phylogenetic relationships of the hoatzin, an enigmatic South American bird](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC40462/). Proc Natl Acad Sci U S A. 1995 Dec 5;92(25):11662-5. doi: 10.1073/pnas.92.25.11662. PMID: 8524824; PMCID: PMC40462.

[8.1] Zhang, G. Bird sequencing project takes off. Nature 522, 34 (2015). https://doi.org/10.1038/522034d

[8.2] Jarvis, E.D., et al. whole-genome analyses resolve early branches in the tree of life of modern birds. Science 346, 1320-133 (2014). DOI: [10.1126/science.1253451](https://www.science.org/doi/10.1126/science.1253451)

[8.3] Feng, S., Stiller, J., Deng, Y. et al. Dense sampling of bird diversity increases power of comparative genomics. Nature 587, 252–257 (2020). https://doi.org/10.1038/s41586-020-2873-9

[9] Gill F, D Donsker & P Rasmussen  (Eds). 2022. IOC World Bird List (v12.2). doi :  10.14344/IOC.ML.12.2.

