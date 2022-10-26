SELECT 
    identifier, 
    name, 
    address, 
    nb_emplyees, 
    open_on_sunday
FROM {{ mockable_source('source', 'restaurants', 'sample__restaurants') }}
qualify row_number() over (partition by identifier order by identifier) = 1