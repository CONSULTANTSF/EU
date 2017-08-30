view: dfp_unfilled_viz {
  sql_table_name: SANDBOXQBIZ.DFP_UNFILLED_VIZ ;;

##@@@@@@@@@@
##@@@@@@@@@@
##DIMENSIONS
##@@@@@@@@@@
##@@@@@@@@@@
  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    sql: sql: CONCAT(${TABLE}.AD_UNIT,'  ', ${TABLE}.PERIOD, '  ', LEFT(${TABLE}.END_DATE,10),'  ',${TABLE}.AD_REQUEST_SIZE) ;;
  }

  dimension: ad_request_size {
    type: string
    sql: ${TABLE}.AD_REQUEST_SIZE ;;
  }

  dimension: period {
    type: string
    hidden: yes
    sql: ${TABLE}.PERIOD ;;
  }

  dimension_group: end {
    type: time
    hidden: yes
    timeframes: [date]
    sql: ${TABLE}.END_DATE ;;
  }

  dimension: site {
    type: string
    hidden: yes
    sql: ${TABLE}.SITE ;;
  }

  dimension: site_name {
    type: string
    hidden: yes
    sql: ${TABLE}.SITE_NAME ;;
  }

  dimension: page {
    type: string
    hidden: yes
    sql: ${TABLE}.PAGE ;;
  }

  dimension: page_name {
    type: string
    hidden: yes
    sql: ${TABLE}.PAGE_NAME ;;
  }

  dimension: placement {
    type: string
    hidden: yes
    sql: ${TABLE}.PLACEMENT ;;
  }

  dimension: placement_name {
    type: string
    hidden: yes
    sql: ${TABLE}.PLACEMENT_NAME ;;
  }

  dimension: ad_unit {
    type: string
    hidden: yes
    sql: ${TABLE}.AD_UNIT ;;
  }

##@@@@@@@@@@
##@@@@@@@@@@
##HIDDEN DIMENSIONS - USED INSIDE MEASURES
##@@@@@@@@@@
##@@@@@@@@@@

  dimension: unfilled_imp {
    type: number
    hidden:  yes
    sql: ${TABLE}.UNFILLED_IMP ;;
  }

##@@@@@@@@@@
##@@@@@@@@@@
##MEASURES
##@@@@@@@@@@
##@@@@@@@@@@

  measure: unfilled_impressions {
    type: sum
    value_format: "$#,##0.00"
    sql: ${unfilled_imp} ;;
  }

  measure: count {
    type: count
    hidden:  yes
    drill_fields: [placement_name, page_name, site_name]
  }
}
