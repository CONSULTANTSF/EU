view: dfp_unfilled_viz {
  sql_table_name: SANDBOXQBIZ.DFP_UNFILLED_VIZ ;;

  dimension: ad_request_size {
    type: string
    sql: ${TABLE}.AD_REQUEST_SIZE ;;
  }

  dimension: ad_unit {
    type: string
    sql: ${TABLE}.AD_UNIT ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.END_DATE ;;
  }

  dimension: page {
    type: string
    sql: ${TABLE}.PAGE ;;
  }

  dimension: page_name {
    type: string
    sql: ${TABLE}.PAGE_NAME ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}.PERIOD ;;
  }

  dimension: placement {
    type: string
    sql: ${TABLE}.PLACEMENT ;;
  }

  dimension: placement_name {
    type: string
    sql: ${TABLE}.PLACEMENT_NAME ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}.SITE ;;
  }

  dimension: site_name {
    type: string
    sql: ${TABLE}.SITE_NAME ;;
  }

  dimension: unfilled_imp {
    type: number
    sql: ${TABLE}.UNFILLED_IMP ;;
  }

  measure: count {
    type: count
    drill_fields: [placement_name, page_name, site_name]
  }
}
