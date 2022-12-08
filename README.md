# BIOF501 Term Project: Generating the (Partial) Avian Phylogenetic Tree

### _By Brooks Perkins-Jechow_

___ 

## Overview

Birds are a very diverse group of vertebrates. To be precise, they are the most diverse (species-wise) of all tetrapod vertebrates [[1]](#references), and among these species is an extraordinary range of physical characteristics and abilities. Hummingbirds have heart rates that can vary from 1000 bpm when excited to 50 bpm when at rest. Owls have eyes so large that they cannot turn them in their sockets, and must instead rotate their heads up to 270 degrees. Arctic terns migrate 70,900 km per year in their trips from their breeding grounds in Iceland and Greenland to their wintering grounds in Antarctica and back. These varied capabilities imply an equally varied genetic makeup, a makeup which already informs our understanding of fields such as neuroscience, developmental biology, and immunology [[2]](#references)[[3]](#references)[[4]](#references).

This genetic variety also makes resolving the evolutionary tree an exceedingly difficult task. Multiple attempts have been made, each differing from the last, and studies continue to add to the pile[5](#references). Pinning down the phylogenetic placement of a specific bird - the hoatzin, a South American bird exhibiting a host of bizarre traits such as having clawed wing digits at birth - has been so difficult that it's become a joke in the phylogenetic community [[6]](#references)[[7]](#references)[[8]](#references). 

Several species of birds, including the chicken (Gallus gallus), pigeon (rock dove) (Columba livia), and zebra finch (Taeniopygia guttata), are already counted among the model research species in such fields as neuroscience and developmental biology (2).

Hoatzin articles
- https://www.nature.com/articles/nature15697.epdf?referrer_access_token=dYPS_vdiSrZCn0QIpkrrotRgN0jAjWel9jnR3ZoTv0M2DJlqpbYXUSzXrY3ePCj9lli0g-87ASrwV9zCmuRb-yBSwhk2MbGjYN4LSqqo508IuixYv2ArUPwmjVeCUtxJqcH3bn53gAq6_baELEjd8dj8SuLpQ-ryl4wzQpWbHwucgGZzCtaabnQf9Xcb8LM9ZmAgvpl5vaeA-bGP702OuunbFOnFwQc46HkRTtQ_hEY%3D&tracking_referrer=arstechnica.com
- https://pubmed.ncbi.nlm.nih.gov/10486983/
- https://www.ncbi.nlm.nih.gov/pmc/articles/PMC40462/

### Species of interest

Species selected based on the IOC World Bird List Version 12.2 

Common name, species name (order, infraclass)

Little spotted kiwi, _Apteryx owenii_ (Apterygiformes, Galeoagnathae)

Helmeted guineafowl, _Numida meleagris_ (Galliformes, Galloanseres)

Mallard, _Anas platyrhynchos_ (Anseriformes, Galloanseres)

Eurasian sparrowhawk, _Accipiter nisus_ (Accipitriformes, Neoaves)

Common kestrel, _Falco tinnunculus_ (Falconiformes, Neoaves)

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

Graphviz=2.42.2-3build2

## Installation

Created a snakemake environment using conda named biof501. I will use this for my project.

Managed to get orthofinder to work through conda. Had to update diamond to the recommended version.

```
conda env create -f environment.yml
```

You will also have to install graphviz.

```
sudo apt install graphviz
```

## Results

The message spit out by CompareTree in the terminal should look like this:

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

[5] Lewis, Dyani. "67 million-year-old fossil upends bird evolutionary tree." _Nature_, 30 Nov. 2022, https://www.nature.com/articles/s41586-022-05445-y. Accessed 07 Dec. 2022

[6] Crair, Ben. "The Bizarre Bird that's Breaking the Tree of Life." _The New Yorker_, 15 Jul. 2022, https://www.newyorker.com/science/elements/the-bizarre-bird-thats-breaking-the-tree-of-life. Accessed 07 Dec. 2022

[7] Hughes, JM, and Baker, AJ, [Phylogenetic relationships of the enigmatic hoatzin (Opisthocomus hoazin) resolved using mitochondrial and nuclear gene sequences](https://pubmed.ncbi.nlm.nih.gov/10486983/), Mol Biol Evol. 1999 Sep;16(9):1300-7. doi: 10.1093/oxfordjournals.molbev.a026220.

[9] Gill F, D Donsker & P Rasmussen  (Eds). 2022. IOC World Bird List (v12.2). doi :  10.14344/IOC.ML.12.2.

