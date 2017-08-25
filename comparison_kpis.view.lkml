view: dfp_comp_viz {
  sql_table_name: SANDBOXQBIZ.DFP_COMP_VIZ ;;

  dimension: ad_unit {
    type: string
    sql: ${TABLE}.AD_UNIT ;;
  }

  dimension: adex_clicks {
    type: number
    sql: ${TABLE}.ADEX_CLICKS ;;
  }

  dimension: adex_revenue {
    type: number
    sql: ${TABLE}.ADEX_REVENUE ;;
  }

  dimension: adex_view_imp {
    type: number
    sql: ${TABLE}.ADEX_VIEW_IMP ;;
  }

  dimension: adserv_clicks {
    type: number
    sql: ${TABLE}.ADSERV_CLICKS ;;
  }

  dimension: adserv_view_imp {
    type: number
    sql: ${TABLE}.ADSERV_VIEW_IMP ;;
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

  dimension: total_clicks {
    type: number
    sql: ${TABLE}.TOTAL_CLICKS ;;
  }

  dimension: total_cpm_cpc_cpd_vcpm {
    type: number
    sql: ${TABLE}.TOTAL_CPM_CPC_CPD_VCPM ;;
  }

  dimension: total_imp {
    type: number
    sql: ${TABLE}.TOTAL_IMP ;;
  }

  dimension: unfilled_imp {
    type: number
    sql: ${TABLE}.UNFILLED_IMP ;;
  }

  dimension: view_imp {
    type: number
    sql: ${TABLE}.VIEW_IMP ;;
  }

  measure: count {
    type: count
    drill_fields: [placement_name, page_name, site_name]
  }
}
