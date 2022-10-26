SELECT 
    identifier, 
    name, 
    address, 
    nb_emplyees, 
    open_on_sunday
FROM {{ mockable_source('public', 'restaurants', 'sample__restaurants') }}
qualify row_number() over (partition by identifier order by identifier) = 1