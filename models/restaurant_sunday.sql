SELECT *
FROM {{ source('public', 'restaurants') }}
WHERE open_on_sunday = true