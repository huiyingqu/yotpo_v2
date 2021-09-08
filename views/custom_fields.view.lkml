view: custom_fields {
  sql_table_name: "YOTPO"."CUSTOM_FIELDS"
    ;;
  drill_fields: [custom_field_id]

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

  dimension: custom_field_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}."CUSTOM_FIELD_ID" ;;
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

  dimension: field_type {
    type: string
    sql: ${TABLE}."FIELD_TYPE" ;;
  }

  dimension: form_id {
    type: number
    hidden: yes
    sql: ${TABLE}."FORM_ID" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}."VALUE" ;;
  }

}
