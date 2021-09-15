connection: "analyst_test_pro_snowflake"

include: "/**/*.view.lkml"
# include: "/*.dashboard.lookml"   # include a LookML dashboard called my_dashboard


explore: reviews {
  from: reviews
  label: "Yotpo Reviews"
  description: "Contains review data from Yotpo.  One row for every completed review."
  view_label: "Yotpo Reviews"

  join: products_reviews {
    view_label: "Products"
    type: left_outer
    relationship: many_to_one
    sql_on: ${reviews.external_product_id} = ${products_reviews.external_product_id} ;;
  }

  join: review_custom_data {
    view_label: "Review Custom Data"
    type: left_outer
    relationship: many_to_many
    sql_on: ${reviews.review_id} = ${review_custom_data.review_id} ;;
    fields: []

  }

  join: custom_fields {
    view_label: "Custom Fields for Reviews"
    type: left_outer
    relationship: one_to_one
    sql_on: ${review_custom_data.custom_field_id} = ${custom_fields.custom_field_id} ;;

  }
}

explore: yotpo_daily {
  from: yotpo_daily_sku_measures
  label: "Reviews and Orders"
  description: "Yotpo review data combined with total order data from order sources.  Allows merchants to see reviews for top 10 products sold all time"
  view_label: "Yotpo Dailies"
}

explore: products_reviews {
  from: products_reviews
  label: "Products"
  description: "Contains product data from Yotpo."
  view_label: "Products"

  join: reviews {
    view_label: "reviews"
    type: left_outer
    relationship: one_to_many
    sql_on: ${products_reviews.external_product_id} = ${reviews.external_product_id} ;;
  }

}
