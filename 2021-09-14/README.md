[![DOI](https://zenodo.org/badge/DOI/10.15468/ky8m-wf48.svg)](https://doi.org/10.15468/ky8m-wf48)

# Backbone 14th September 2021

In this [2021-09-14 edition](https://hosted-datasets.gbif.org/datasets/backbone/2021-09-14/) of the GBIF Backbone 
we have adressed various issues both in content but also in development work that lead to a better overall taxonomy. 
Further details can be seen in the 2021 Septermber column of our [Github project board](https://github.com/orgs/gbif/projects/5). 
Here we want to point out some major achievements:

### Data source changes
The Catalogue of Life (COL) Checklist version August 2021 has been used as the basis and for most of the hierarchy.
In addition to the prokaryotic kingdoms Bacteria and Archaea as well as the Fabaceae plant family, this Backbone also blocks all of the insect order Diptera
and instead makes use of [Systema Dipterorum](http://www.diptera.org) directly. 
This was done as the version of Systema Dipterorum integrated into 
COL suffered serious problems and is only seen as a temporary solution we will likely rollback in the next Backbone edition.

3 Columbian national lists ([birds](https://www.gbif.org/dataset/6c9c4b08-4cec-4160-a708-7f16060d7db0), 
[plants](https://www.gbif.org/dataset/5c0b1470-8884-4914-ae76-70a7c81d6d08), 
[vertebrates](https://www.gbif.org/dataset/973da290-27d9-48cc-9e29-3186dafdb506))
and the [United Kingdom Species Inventory (UKSI)](https://www.gbif.org/dataset/dbaa27eb-29e7-4cbb-8eab-3f689cfce116)
are new additions to our [source list](https://hosted-datasets.gbif.org/datasets/backbone/2021-09-14/config.yaml).

Many other sources have seen considerable updates.
In particular [Palaeobiology Database](https://www.gbif.org/dataset/bb5b30b4-827e-4d5e-a86a-825d65cb6583) and 
[Index Fungorum](https://www.gbif.org/dataset/bf3db7c9-5e5d-4fd0-bd5b-94539eaf9598) were updated to their latest version, 
something we have not done for several years.
As always [Plazi](https://www.gbif.org/publisher/7ce8aef0-9e92-11dc-8738-b8a03c50a862) has been adding many new publications 
containing many new species descriptions.

### Name matching
We improved the [name matching](https://www.gbif.org/tools/species-lookup) code, better scoring rank differences
and altering fuzzy matches to snap to the genus instead in cases when the fuzzy match yield a bionomial with a slightly different genus.
See [portal-feedback#2930](https://github.com/gbif/portal-feedback/issues/2930)

The matching of [GTDB OTU names](https://www.gbif.org/species/search?dataset_key=d7dddbf4-2cf0-4f39-9b2a-bb099caae36c&constituent_key=a97f36e5-ded1-49cc-bdec-ac6170fc7b9c&name_type=OTU&advanced=1)
was improved which before resulted in no matches in many cases even if the exact name was given.
The matching of those names is now also case insensitive.

### Name parser
The [name parser library](https://github.com/gbif/name-parser) was updated to better parse various authorships 
that have been reported to fail before. This directly also improves our name matching.

### Algorithm improvements
The Backbone Building algorithm now allows to configure an optional taxonomic scope for each source.
This allows to better snap names in those sources to their expected part of the tree.
