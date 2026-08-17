@id("a950c3ba-a890-4b09-82d4-ed0ca308cba1")
@nodeType("701")
SELECT
     "N_NATIONKEY" AS "N_NATIONKEY" @defaultValue(0),
     "N_NAME" AS "N_NAME",
     "N_REGIONKEY" AS "N_REGIONKEY",
     "N_COMMENT" AS "N_COMMENT"
FROM {{ ref('SOURCE', 'nation') }} `nation`