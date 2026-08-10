@id("759e972e-3cf3-4a7d-b89b-77eb262dbd85")
@nodeType("698")
SELECT
     "N_NATIONKEY" AS "N_NATIONKEY" @nullable(false),
     "N_NAME" AS "N_NAME",
     "N_REGIONKEY" AS "N_REGIONKEY",
     "N_COMMENT" AS "N_COMMENT",
     "last_modified" AS "last_modified"
FROM {{ ref('SOURCE2', 'nation') }} `nation`