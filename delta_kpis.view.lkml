view: dfp_delta {
  sql_table_name: SANDBOXQBIZ.DFP_DELTA ;;

##@@@@@@@@@@
##@@@@@@@@@@
##DIMENSIONS
##@@@@@@@@@@
##@@@@@@@@@@

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    sql: sql: CONCAT(${TABLE}.AD_UNIT,'  ', ${TABLE}.PERIOD, '  ', LEFT(${TABLE}.END_DATE,10)) ;;
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
##MEASURES - CURRENT PERIOD
##@@@@@@@@@@
##@@@@@@@@@@

  measure: ad_exchange_clicks {
    type: sum
    sql: ${TABLE}.ADEX_CLICKS ;;
  }

  measure: ad_exchange_revenue {
    type: sum
    sql: ${TABLE}.ADEX_REVENUE ;;
  }

  measure: ad_exchange_view_impressions {
    type: sum
    sql: ${TABLE}.ADEX_VIEW_IMP ;;
  }

  measure: ad_server_clicks {
    type: sum
    sql: ${TABLE}.ADSERV_CLICKS ;;
  }

  measure: ad_server_view_impressions {
    type: sum
    sql: ${TABLE}.ADSERV_VIEW_IMP ;;
  }

  measure: total_clicks {
    type: sum
    sql: ${TABLE}.TOTAL_CLICKS ;;
  }

  measure: total_cpm_cpc_cpd_vcpm {
    type: sum
    sql: ${TABLE}.TOTAL_CPM_CPC_CPD_VCPM ;;
  }

  measure: total_impressions {
    type: sum
    sql: ${TABLE}.TOTAL_IMP ;;
  }

  measure: unfilled_impressions {
    type: sum
    sql: ${TABLE}.UNFILLED_IMP ;;
  }

  measure: view_impressions {
    type: sum
    sql: ${TABLE}.VIEW_IMP ;;
  }

##@@@@@@@@@@
##@@@@@@@@@@
##MEASURES - PREVIOUS PERIOD
##@@@@@@@@@@
##@@@@@@@@@@

  measure: ad_exchange_clicks_prev {
    type: sum
    sql: ${TABLE}.ADEX_CLICKS_PREV ;;
  }

  measure: ad_exchange_revenue_prev {
    type: sum
    sql: ${TABLE}.ADEX_REVENUE_PREV ;;
  }

  measure: ad_exchange_view_impressions_prev {
    type: sum
    sql: ${TABLE}.ADEX_VIEW_IMP_PREV ;;
  }

  measure: ad_server_clicks_prev {
    type: sum
    sql: ${TABLE}.ADSERV_CLICKS_PREV ;;
  }

  measure: ad_server_view_impressions_prev {
    type: sum
    sql: ${TABLE}.ADSERV_VIEW_IMP_PREV ;;
  }

  measure: total_clicks_prev {
    type: sum
    sql: ${TABLE}.TOTAL_CLICKS_PREV ;;
  }

  measure: total_cpm_cpc_cpd_vcpm_prev {
    type: sum
    sql: ${TABLE}.TOTAL_CPM_CPC_CPD_VCPM_PREV ;;
  }

  measure: total_impressions_prev {
    type: sum
    sql: ${TABLE}.TOTAL_IMP_PREV ;;
  }

  measure: unfilled_impressions_prev {
    type: sum
    sql: ${TABLE}.UNFILLED_IMP_PREV ;;
  }

  measure: view_impressions_prev {
    type: sum
    sql: ${TABLE}.VIEW_IMP_PREV ;;
  }

  measure: count {
    hidden:  yes
    type: count
    drill_fields: [placement_name, page_name, site_name]
  }

##@@@@@@@@@@
##@@@@@@@@@@
##CALCULATED MEASURES
##@@@@@@@@@@
##@@@@@@@@@@

  measure: vCTR {
    type: number
    value_format: "0.00%"
    sql: CASE WHEN 1.0*${view_impressions} > 0 THEN (CASE WHEN 1.0*${total_clicks} > 0 THEN 1.0*(${total_clicks}/${view_impressions}) ELSE 0.0 END) ELSE (CASE WHEN 1.0*${total_clicks} > 0 THEN 1.0 ELSE 0.0 END) END ;;
  }

  measure: vCTR_prev {
    type: number
    value_format: "0.00%"
    sql: CASE WHEN 1.0*${view_impressions_prev} > 0 THEN (CASE WHEN 1.0*${total_clicks_prev} > 0 THEN 1.0*(${total_clicks_prev}/${view_impressions_prev}) ELSE 0.0 END) ELSE (CASE WHEN 1.0*${total_clicks_prev} > 0 THEN 1.0 ELSE 0.0 END) END ;;
  }

  measure: vCTR_delta {
    type: number
    value_format: "0.00%"
    sql:  ${vCTR} - ${vCTR_prev};;
  }
}
