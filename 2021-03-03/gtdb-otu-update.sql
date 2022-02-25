
update name n set type='OTU' from name_usage u where u.name_fk=n.id and u.dataset_key='a97f36e5-ded1-49cc-bdec-ac6170fc7b9c' and u.origin='SOURCE' and n.type IN ('HYBRID', 'BLACKLISTED', 'DOUBTFUL', 'NO_NAME', 'INFORMAL');

update name n set type='OTU' from name_usage u where u.name_fk=n.id and u.dataset_key='a97f36e5-ded1-49cc-bdec-ac6170fc7b9c' and n.type = 'NO_NAME';

update name n set type='OTU' from name_usage u where u.name_fk=n.id and u.dataset_key='a97f36e5-ded1-49cc-bdec-ac6170fc7b9c' and n.scientific_name like '%-%';


# good for getting an overview of name types in GTDB
select n.rank,origin,n.type, count(*) from name n , name_usage u where u.name_fk=n.id and u.dataset_key='a97f36e5-ded1-49cc-bdec-ac6170fc7b9c' group by 1,2,3 order by 3,2,1;

