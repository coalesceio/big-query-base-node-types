@id("f6122216-4d7b-483a-bfd4-ab0c0ee52f1f")
@nodeType("698")
SELECT
     "N_NATIONKEY" AS "N_NATIONKEY",
     "N_NAME" AS "N_NAME",
     "N_REGIONKEY" AS "N_REGIONKEY" @nullable(false),
     "N_COMMENT" AS "N_COMMENT",
     "last_modified" AS "last_modified"
FROM {{ ref('SOURCE2', 'nation') }} `nation`