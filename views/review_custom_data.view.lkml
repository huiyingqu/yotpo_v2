view: review_custom_data {
  sql_table_name: "YOTPO"."REVIEW_CUSTOM_DATA"
    ;;

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

  dimension: custom_field_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."CUSTOM_FIELD_ID" ;;
  }

  dimension: review_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."REVIEW_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [custom_fields.custom_field_id, reviews.user_name, reviews.review_id]
  }
}
