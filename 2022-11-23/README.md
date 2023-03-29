
[![DOI](https://zenodo.org/badge/DOI/10.15468/56cv-7w97.svg)](https://doi.org/10.15468/56cv-7w97)

# Backbone 23rd November 2022

In this [2022-11-23 edition](https://hosted-datasets.gbif.org/datasets/backbone/2022-11-23/) of the GBIF Backbone
we have updated various sources but also had small changes to [configurations](https://hosted-datasets.gbif.org/datasets/backbone/2022-11-23/config.yaml) 
and the name matching software.


### Data source changes
The [Catalogue of Life (COL) Annual Checklist 2022](https://doi.org/10.48580/dfq8) has been used as the basis and for most of the hierarchy.
New sources added in this version:

 - [Myriatrix](https://www.gbif.org/dataset/994e75fa-b187-4b07-a30e-665f4acbe394) for Myriapoda, see [checklistbank#222](https://github.com/gbif/checklistbank/issues/222)
 - [Hominidae](https://www.gbif.org/dataset/7be186c4-5572-44e6-9f11-69ddbfd95078) a source for hominid species
 
As always [Plazi](https://www.gbif.org/publisher/7ce8aef0-9e92-11dc-8738-b8a03c50a862) has been adding many new publications containing new species descriptions.


### New Vertebrate classification
The Backbone follows Catalogue of Life that have adopted a [new Vertebrate classification](https://github.com/CatalogueOfLife/testing/issues/186) that removes common taxa like Reptilia & Actinopterygii and raises former orders [Squamata](https://www.catalogueoflife.org/data/taxon/45C), [Testudines](https://www.catalogueoflife.org/data/taxon/477) and [Crocodylia](https://www.catalogueoflife.org/data/taxon/329) to class level.

### Name matching
We have improved matching to higher taxa in case there are multiple equal matches, 
utilising the classification of the equal matches, not just that of the query. 
See [checklistbank#250](https://github.com/gbif/checklistbank/issues/250) for more details.

### Known problems
The Virus classification in the Catalogue of Life has changed drastically, now following strictly the ICTV source with 10 kingdoms and several realms.
As GBIF still works with a single Virus kingdom this caused problems and resulted in most of the virus names being placed under the Incertae sedis kingdom.

