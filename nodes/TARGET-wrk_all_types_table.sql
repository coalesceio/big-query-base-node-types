@id("3dcaefbf-243c-412c-a595-c6b81985d4c7")
@nodeType("698")
SELECT
     "id" AS "id" @defaultValue("1"),
     "price" AS "price" @defaultValue("1"),
     "rating" AS "rating" @defaultValue("1"),
     "is_active" AS "is_active" @defaultValue(true),
     "description" AS "description" @defaultValue("1"),
     "created_date" AS "created_date" @defaultValue("current_date()"),
     "created_time" AS "created_time" @defaultValue("current_time()"),
     "created_dt" AS "created_dt"  @defaultValue("current_datetime()"),
     "created_ts" AS "created_ts" @defaultValue("current_timestamp()"),
     "json_data" AS "json_data" @defaultValue("JSON '{}'"),
     "tags" AS "tags",
     "scores" AS "scores",
     "geography_data" AS "geography_data" @defaultValue("ST_GEOGPOINT(0, 0)")
FROM {{ ref('SOURCE2', 'all_types_table') }} `all_types_table`