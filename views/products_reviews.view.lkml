view: products_reviews {
  sql_table_name: "YOTPO"."PRODUCTS"
    ;;
  drill_fields: [product_id]

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."UPDATED_AT" ;;
  }

  dimension_group: __synced {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."__SYNCED_AT" ;;
  }

  dimension: product_id {
    primary_key: yes
    type: number
    group_label: "ID"
    sql: ${TABLE}."PRODUCT_ID" ;;
  }

  dimension: __source_id {
    type: string
    hidden: yes
    sql: ${TABLE}."__SOURCE_ID" ;;
  }

  dimension: __sync_key {
    type: string
    hidden: yes
    sql: ${TABLE}."__SYNC_KEY" ;;
  }

  dimension: _account_id {
    type: string
    hidden: yes
    sql: ${TABLE}."_ACCOUNT_ID" ;;
  }

  dimension: score {
    type: number
    hidden: yes
    sql: ${TABLE}."AVERAGE_SCORE" ;;
  }

  dimension: category_id {
    type: number
    group_label: "ID"
    sql: ${TABLE}."CATEGORY_ID" ;;
  }

  dimension: category_name {
    type: number
    sql: ${TABLE}."CATEGORY_NAME" ;;
  }

  dimension: description {
    type: string
    label: "Product Description"
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: external_product_id {
    type: string
    group_label: "ID"
    sql: ${TABLE}."EXTERNAL_PRODUCT_ID" ;;
  }

  dimension: name {
    type: string
    label: "Product Name"
    sql: ${TABLE}."NAME" ;;
  }

  dimension: reviews {
    type: number
    hidden: yes
    sql: ${TABLE}."TOTAL_REVIEWS" ;;
  }

  dimension: url {
    type: string
    hidden: yes
    sql: ${TABLE}."URL" ;;
  }

  measure: average_score {
    type: average
    sql: ${score} ;;
  }

  measure: total_reviews {
    type: sum
    sql: ${reviews} ;;
  }
}
