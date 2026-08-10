@id("f4fe2c04-a9c1-4349-bdf4-1f6ef54af743")
@nodeType("698")
SELECT
     "N_NATIONKEY" AS "N_NATIONKEY",
     "N_NAME" AS "N_NAME",
     "N_REGIONKEY" AS "N_REGIONKEY" @nullable(false),
     "N_COMMENT" AS "N_COMMENT",
     "last_modified" AS "last_modified"
FROM {{ ref('SOURCE2', 'nation') }} `nation`