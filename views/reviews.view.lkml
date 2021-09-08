view: reviews {
  sql_table_name: "YOTPO"."REVIEWS"
    ;;
  drill_fields: [review_id]


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

  dimension: review_id {
    primary_key: yes
    label: "Review ID"
    group_label: "ID"
    type: number
    sql: ${TABLE}."REVIEW_ID" ;;
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

  dimension: comment {
    type: string
    label: "Review Comment"
    group_label: "Reviews"
    description: "The comment of the review"
    sql: ${TABLE}."COMMENT" ;;
  }

  dimension: content {
    type: string
    label: "Review Content"
    group_label: "Reviews"
    description: "The content of the review"
    sql: ${TABLE}.content ;;
  }

  dimension: external_order_id {
    type: string
    group_label: "ID"
    sql: ${TABLE}."EXTERNAL_ORDER_ID" ;;
  }

  dimension: external_product_id {
    type: string
    hidden: yes
    sql: ${TABLE}."EXTERNAL_PRODUCT_ID" ;;
  }

  dimension: order_id {
    type: number
    group_label: "ID"
    sql: ${TABLE}."ORDER_ID" ;;
  }

  dimension: product_id {
    type: number
    hidden: yes
    sql: ${TABLE}."PRODUCT_ID" ;;
  }

  dimension: published {
    type: yesno
    sql: ${TABLE}."PUBLISHED" ;;
  }

  dimension: score {
    type: number
    hidden: yes
    sql: ${TABLE}."SCORE" ;;
  }

  dimension: title {
    type: string
    label: "Review Title"
    group_label: "Reviews"
    description: "The title of the review"
    sql: ${TABLE}."TITLE" ;;
  }

  dimension: user_email {
    #required_access_grants:: [can_see_pii_data]
    hidden: yes
    type: string
    sql: ${TABLE}."USER_EMAIL" ;;
  }

  dimension: user_id {
    #required_access_grants: [can_see_pii_data]
    hidden: yes
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: user_name {
    #required_access_grants: [can_see_pii_data]
    hidden: yes
    type: string
    sql: ${TABLE}."USER_NAME" ;;
  }

  dimension: verified_buyer {
    type: yesno
    sql: ${TABLE}."VERIFIED_BUYER" ;;
  }

  dimension: votes_down {
    type: number
    sql: ${TABLE}."VOTES_DOWN" ;;
  }

  dimension: votes_up {
    type: number
    sql: ${TABLE}."VOTES_UP" ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [review_id, user_name, review_custom_data.count]
  }

  measure: total_reviews {
    label: "Review Count"
    group_label: "Count"
    type: count_distinct
    sql: ${review_id} ;;
  }

  measure: avg_review_score {
    label: "Average Review Score"
    group_label: "Average"
    type: average
    value_format_name: decimal_2
    sql: ${score} ;;
  }

  measure: total_votes_up {
    label: "Total Votes Up"
    group_label: "Sum"
    type: sum
    value_format_name: decimal_2
    sql: ${votes_up} ;;
  }

  measure: total_votes_down {
    label: "Total Votes Down"
    group_label: "Sum"
    type: sum
    value_format_name: decimal_2
    sql: ${votes_down} ;;
  }

}
