@id("3a7050bd-7190-4ad3-9fe5-14080aab89a8")
@nodeType("698")
SELECT
     "N_NATIONKEY" AS "N_NATIONKEY",
     "N_NAME" AS "N_NAME",
     "N_REGIONKEY" AS "N_REGIONKEY" @description("New-edited"),
     "N_COMMENT" AS "N_COMMENT",
     "last_modified" AS "last_modified"
FROM {{ ref('SOURCE2', 'nation') }} `nation`