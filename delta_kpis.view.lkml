view: dfp_delta {
  sql_table_name: SANDBOXQBIZ.DFP_DELTA ;;

  dimension: ad_unit {
    type: string
    sql: ${TABLE}.AD_UNIT ;;
  }

  dimension: adex_clicks {
    type: number
    sql: ${TABLE}.ADEX_CLICKS ;;
  }

  dimension: adex_clicks_prev {
    type: number
    sql: ${TABLE}.ADEX_CLICKS_PREV ;;
  }

  dimension: adex_revenue {
    type: number
    sql: ${TABLE}.ADEX_REVENUE ;;
  }

  dimension: adex_revenue_prev {
    type: number
    sql: ${TABLE}.ADEX_REVENUE_PREV ;;
  }

  dimension: adex_view_imp {
    type: number
    sql: ${TABLE}.ADEX_VIEW_IMP ;;
  }

  dimension: adex_view_imp_prev {
    type: number
    sql: ${TABLE}.ADEX_VIEW_IMP_PREV ;;
  }

  dimension: adserv_clicks {
    type: number
    sql: ${TABLE}.ADSERV_CLICKS ;;
  }

  dimension: adserv_clicks_prev {
    type: number
    sql: ${TABLE}.ADSERV_CLICKS_PREV ;;
  }

  dimension: adserv_view_imp {
    type: number
    sql: ${TABLE}.ADSERV_VIEW_IMP ;;
  }

  dimension: adserv_view_imp_prev {
    type: number
    sql: ${TABLE}.ADSERV_VIEW_IMP_PREV ;;
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

  dimension: total_clicks_prev {
    type: number
    sql: ${TABLE}.TOTAL_CLICKS_PREV ;;
  }

  dimension: total_cpm_cpc_cpd_vcpm {
    type: number
    sql: ${TABLE}.TOTAL_CPM_CPC_CPD_VCPM ;;
  }

  dimension: total_cpm_cpc_cpd_vcpm_prev {
    type: number
    sql: ${TABLE}.TOTAL_CPM_CPC_CPD_VCPM_PREV ;;
  }

  dimension: total_imp {
    type: number
    sql: ${TABLE}.TOTAL_IMP ;;
  }

  dimension: total_imp_prev {
    type: number
    sql: ${TABLE}.TOTAL_IMP_PREV ;;
  }

  dimension: unfilled_imp {
    type: number
    sql: ${TABLE}.UNFILLED_IMP ;;
  }

  dimension: unfilled_imp_prev {
    type: number
    sql: ${TABLE}.UNFILLED_IMP_PREV ;;
  }

  dimension: view_imp {
    type: number
    sql: ${TABLE}.VIEW_IMP ;;
  }

  dimension: view_imp_prev {
    type: number
    sql: ${TABLE}.VIEW_IMP_PREV ;;
  }

  measure: count {
    type: count
    drill_fields: [page_name, placement_name, site_name]
  }
}
