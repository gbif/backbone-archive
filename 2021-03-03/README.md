[![DOI](https://zenodo.org/badge/DOI/10.15468/z8f1-kv47.svg)](https://doi.org/10.15468/z8f1-kv47)

# Backbone 3rd March 2021

In this [2021-03-03 edition](https://hosted-datasets.gbif.org/datasets/backbone/2021-03-03/) of the GBIF Backbone we have adressed various issues both in content but also in development work
that lead to a better overall taxonomy. Further details can be seen in the closed [Github project board](https://github.com/gbif/checklistbank/projects/1). Here we want to point out some major achievements:

### Data source changes
We have advanced the Backbone Building so that we can block certain groups or subtree of a source by configuration only.
This new feature has been used to block the prokaryotic kingdoms Bacteria and Archaea as well as the Fabaceae plant family from Catalogue of Life.

Instead we decided to follow Kews [World Checklist of Vascular Plants](https://wcvp.science.kew.org) for Fabaceae, which we made available in Darwin Core to index into [GBIF](https://www.gbif.org/dataset/f382f0ce-323a-4091-bb9f-add557f3a9a2).

For the prokaryotic kingdoms we now primarily follow the [Genome Taxonomy Database](https://www.gbif.org/dataset/a97f36e5-ded1-49cc-bdec-ac6170fc7b9c).

As usual, other sources are still used to augment these primary sources.
The [Danish National Checklist](https://www.gbif.org/dataset/4b3e4a71-704a-485c-917c-20a89944ea37) is a new addition for such augementation, surprisingly [adding even new synonym names for birds](https://www.gbif.org/species/search?dataset_key=d7dddbf4-2cf0-4f39-9b2a-bb099caae36c&constituent_key=4b3e4a71-704a-485c-917c-20a89944ea37&highertaxon_key=212&advanced=1) that have not been covered by any of the previous sources like COL, Clements, IOC or IRMNG.

We also decided to remove the [GBIF Type Specimen Names](https://www.gbif.org/dataset/6cfd67d6-4f9b-400b-8549-1933ac27936f) dataset from the Backbone sources.
It is a derived dataset from all GBIF occurrences that represent type specimens. But even though it goes through some cleaning it has been the number one source for reported problem in the backbone, often due to mispellings. There is no source in the backbone now that draws names from occurrences.

Many other sources have seen considerbale updates since we last build a backbone at the end of 2019.
As always Plazi has been adding many new publications containing many new species descriptions.

### Stable identifiers
We improved the code assigning stable identifiers to backbone taxa. The biggest improvements was the needed to handle unparsable names, especially OTU names which we introduced for BOLD and Unite Species Hypothesis in the last version for the first time.

We also greatly improved how identical uninomials were handled, which previously often resulted in key changes for many genera.

### Algorithm improvements
The Backbone Building algorithm was improved in several ways. 

One of the worst problems we had in the backbone is when entire genera or even families are placed in an entirely wrong part of the tree. 
For example the bird [Sagittarius serpentarius was misplaced in Chromista](https://github.com/gbif/checklistbank/issues/119)! 
It turned out that most of these cases resulted in a bad merger of "homonym like" names found in COL. The previous code did not expect accepted "homonyms" in the same kingdom on the suprageneric level in the same source, but which did occurr for good reasons in COL. This was fixed resolving various reported problems:

 - [Hirundo javanica](https://github.com/gbif/portal-feedback/issues/3250)
 - [Sagittarius serpentarius](https://github.com/gbif/checklistbank/issues/119)
 - genus [Ixodes](https://github.com/gbif/portal-feedback/issues/2732)
 - 2x family [Personidae](https://github.com/gbif/portal-feedback/issues/3170) and similar for Sagittariidae & Cepolidae

When assigning stable IDs we need to match the new backbone against the previous version. We discovered that the implemented authorship comparison was too lose and resulted in bad matches that lead to instable IDs. We therefore implemented a stricter authorship matching, also requiring the exact same year if existing (previously we allowed one year off).
This also avoided bad basionym detection and subsequent wrong homotypic synonymisation. E.g. 

 - [Triepeolus cressonii (Robertson, 1897) and Nomada cressonii Robertson, 1893](https://github.com/gbif/portal-feedback/issues/3282) 
 - [Hoplitis producta (Cresson, 1864) vs Coelioxys producta Cresson, 1865](https://github.com/gbif/portal-feedback/issues/2696)


### Occurrence matching
The occurrence matching service was slightly improved to avoid `indet` as a fuzzy species epithet match.


### Cleaning
Various non names were removed:

 - 32x Unindent-{Somename}: https://www.gbif.org/species/search?q=Unident&qField=SCIENTIFIC
 - species "Flowering plant"
 - genus "Scientific"
