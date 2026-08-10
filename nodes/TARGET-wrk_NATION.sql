@id("12451804-cc73-4e95-8ec1-eb04428e6df2")
@nodeType("698")
@tests("SELECT 1 FROM {{ this }} GROUP BY N_COMMENT_1 HAVING COUNT(*) > 1", "Before", true)
@tests("SELECT 1 FROM {{ this }}", "After", true)
@testsEnabled(true)
@preSQL("SELECT 1 FROM {{ this }} GROUP BY N_COMMENT_1 HAVING COUNT(*) > 1")
@postSQL("SELECT 1 FROM {{ this }} GROUP BY N_COMMENT_1 HAVING COUNT(*) > 1")
@description("Adde description mkazdklj""'''adfkh")
SELECT
     "N_NATIONKEY" AS "N_NATIONKEY" @nullable("false") @description("Hello") @defaultValue("10") @inHash("1|GH_COL") @tests("unique"),
     "N_NAME" AS "N_NAME" @description("Hel''ksklo") @defaultValue("NA") @tests("null", "unique") @inHash("2|GH_COL"),
     "N_REGIONKEY" AS "N_REGIONKEY" @defaultValue(9)  @tests("null", "unique"),
     "N_COMMENT" AS "N_COMMENT_1" @tests("null"),
     CAST({{ get_hash('GH_COL') }} AS STRING) AS "GH_COL"
FROM {{ ref('SOURCE2', 'nation') }} `nation`