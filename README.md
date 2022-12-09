# BIOF501 Term Project: Generating the (Partial) Avian Phylogenetic Tree

### _By Brooks Perkins-Jechow_

___ 

## Overview

Birds are a very diverse group of vertebrates. To be precise, they are the most diverse (species-wise) of all tetrapod vertebrates [[1]](#references), and among these species is an extraordinary range of physical characteristics and abilities. Hummingbirds have heart rates that can vary from 1000 bpm when excited to 50 bpm when at rest. Owls have eyes so large that they cannot turn them in their sockets, and must instead rotate their heads up to 270 degrees. Arctic terns migrate 70,900 km per year in their trips from their breeding grounds in Iceland and Greenland to their wintering grounds in Antarctica and back. These varied capabilities imply an equally varied genetic makeup, a makeup which already informs our understanding of fields such as neuroscience, developmental biology, and immunology [[2]](#references)[[3]](#references)[[4]](#references).

This genetic variety also makes resolving the evolutionary tree an exceedingly difficult task. Multiple attempts have been made, each differing from the last, and studies continue to add to the pile [[4.01]](#references)[[4.1]](#references)[[5]](#references). Pinning down the phylogenetic placement of one bird - the hoatzin, a South American bird exhibiting a host of bizarre traits such as having clawed wing digits at birth - has been so difficult that it seems to be a running joke to describe it as "enigmatic" [[6]](#references)[[7]](#references)[[8]](#references). 


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

Python=3.6.13

Diamond=0.9.24

Snakemake=3.13.3

IQTree=2.1.4_beta

MAFFT=7.505

Orthofinder=2.5.4

Perl=5.26.2

Plottree=0.0.2

BioPython=1.79

Graphviz=0.19.1

## Installation

Created a snakemake environment using conda named biof501. I will use this for my project.

Managed to get orthofinder to work through conda. Had to update diamond to the recommended version.

```
conda env create -f environment.yml
```

Alternative installation:

```
conda deactivate
```

```
conda create -n biof501
```

```
conda activate biof501
```

```
conda install -c bioconda snakemake=3.13.3
```

```
conda install -c bioconda orthofinder

```

```
pip install plottree
```

```
pip install graphviz
```

```
conda install -c bioconda diamond=0.9.24
```

## Results

The message produced by CompareTree in the terminal should look like this:

```
Splits  Found   3       Total   6       Frac    0.5     MaxLnDf 0.0124  Ratio   1.74    MaxBtDf 0.918
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

[9] Gill F, D Donsker & P Rasmussen  (Eds). 2022. IOC World Bird List (v12.2). doi :  10.14344/IOC.ML.12.2.

