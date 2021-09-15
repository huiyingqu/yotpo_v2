view: yotpo_daily_sku_measures {
  sql_table_name: drp.yotpo_daily_sku_measures ;;


# Dimension Groups
  dimension_group: _loaded_at {
    type: time
    timeframes: [raw, time, date, day_of_week, day_of_week_index, week, month, month_name, month_num, quarter, year]
    hidden: yes
    sql: ${TABLE}._loaded_at ;;
  }

  dimension_group: date {
    type: time
    timeframes: [raw, time, date, day_of_week, day_of_week_index, week, month, month_name, month_num, quarter, year]
    hidden: no
    label: "Review/Order"
    description: "Date of the orders or reviews associated with this SKU"
    sql: ${TABLE}.date ;;
  }


# Dimensions
  dimension: id {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: product_id {
    type: string
    description: "The Product ID associated with the order or review"
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_name {
    type: string
    description: "The name of the Product from the order or review"
    sql: ${TABLE}.product_name ;;
  }

  dimension: item_count_dim {
    type: number
    hidden: yes
    sql: NVL(${TABLE}.item_count,0) ;;
  }

  dimension: review_count_dim {
    type: number
    hidden: yes
    sql: NVL(${TABLE}.review_count,0) ;;
  }

  dimension: score_dim {
    type: number
    hidden: yes
    sql: NVL(${TABLE}.total_score,0) ;;
  }

  dimension: fivestar_count_dim {
    type: number
    hidden: yes
    sql: NVL(${TABLE}.fivestar_count,0) ;;
  }


# Measures
  measure: item_count {
    type: sum
    hidden: no
    label: "Count - Units Sold"
    description: "Number of units sold"
    sql: ${item_count_dim} ;;
    value_format_name: decimal_0
  }

  measure: review_count {
    type: sum
    hidden: no
    label: "Count - Reviews"
    description: "Number of reviews"
    sql: ${review_count_dim} ;;
    value_format_name: decimal_0
  }

  measure: average_score {
    type: number
    hidden: no
    label: "Average - Score"
    description: "The average score of the reviews"
    sql: SUM(${score_dim})/NULLIF(SUM(${review_count_dim}),0) ;;
    value_format_name: decimal_4
  }

  measure: fivestar_count {
    type: sum
    hidden: no
    label: "Count - Five-Star Reviews"
    description: "The number of five-star reviews"
    sql: ${fivestar_count_dim} ;;
    value_format_name: decimal_0
  }


  measure: order_to_review_pct {
    type: number
    hidden: no
    label: "Percent - Reviews to Orders"
    description: "The ratio of reviews to units sold"
    sql: SUM(${review_count_dim}*1.0) / NULLIF(SUM(${item_count_dim}*1.0),0) ;;
    value_format_name: percent_2
  }

# BASE DAASITY LOOKML END
# Insert all the customized LookML below here otherwise is may be removed / deleted when an update from Daasity is pushed.  Daasity will replace all code
# between the BEGIN and END
}
