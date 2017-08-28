view: dfp_imp_daily_viz {
  sql_table_name: SANDBOXQBIZ.DFP_IMP_DAILY_VIZ ;;

##@@@@@@@@@@
##@@@@@@@@@@
##DIMENSIONS
##@@@@@@@@@@
##@@@@@@@@@@
  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    sql: sql: CONCAT(${TABLE}.AD_UNIT,'  ', ${TABLE}.PERIOD, '  ', LEFT(${TABLE}.END_DATE,10), '  ', LEFT(${TABLE}.DATE,10)) ;;
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

  dimension_group: date {
    type: time
    timeframes: [date]
    sql: ${TABLE}.DATE ;;
  }

  dimension: date_string {
    type: string
    sql: ${TABLE}.DATE_STRING ;;
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
##MEASURES
##@@@@@@@@@@
##@@@@@@@@@@

  measure: ad_exchange_clicks {
    type: sum
    value_format: "0.0,\" K\""
    sql: ${TABLE}.ADEX_CLICKS ;;
  }

  measure: ad_exchange_revenue {
    type: sum
    value_format: "$#.00,\" K\""
    sql: ${TABLE}.ADEX_REVENUE ;;
  }

  measure: ad_exchange_view_impressions {
    type: sum
    value_format: "0.0,,\" M\""
    sql: ${TABLE}.ADEX_VIEW_IMP ;;
  }

  measure: ad_server_clicks {
    type: sum
    value_format: "0.0,\" K\""
    sql: ${TABLE}.ADSERV_CLICKS ;;
  }

  measure: ad_server_view_impressions {
    type: sum
    value_format: "0.0,,\" M\""
    sql: ${TABLE}.ADSERV_VIEW_IMP ;;
  }

  measure: total_clicks {
    type: sum
    value_format: "0.0,\" K\""
    sql: ${TABLE}.TOTAL_CLICKS ;;
  }

  measure: total_cpm_cpc_cpd_vcpm {
    type: sum
    value_format: "$#,##0.00"
    sql: ${TABLE}.TOTAL_CPM_CPC_CPD_VCPM ;;
  }

  measure: total_impressions {
    type: sum
    value_format: "0.0,,\" M\""
    sql: ${TABLE}.TOTAL_IMP ;;
  }

  measure: unfilled_impressions {
    type: sum
    value_format: "$#,##0.00"
    sql: ${TABLE}.UNFILLED_IMP ;;
  }

  measure: view_impressions {
    type: sum
    value_format: "0.0,,\" M\""
    sql: ${TABLE}.VIEW_IMP ;;
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

  measure: non_view_impressions {
    type: sum
    value_format: "0.0,,\" M\""
    sql: ${TABLE}.TOTAL_IMP - ${TABLE}.VIEW_IMP ;;
  }

  measure: CTR {
    type: number
    value_format: "0.00%"
    sql: CASE WHEN 1.0*${total_impressions} > 0 THEN (CASE WHEN 1.0*${total_clicks} > 0 THEN 1.0*(${total_clicks}/${total_impressions}) ELSE 0.0 END) ELSE (CASE WHEN 1.0*${total_clicks} > 0 THEN 1.0 ELSE 0.0 END) END ;;
  }

  measure: ad_server_clicks_pcnt {
    type: number
    value_format: "0.00%"
    sql: CASE WHEN 1.0*${total_clicks} > 0 THEN (CASE WHEN 1.0*${ad_server_clicks} > 0 THEN 1.0*(${ad_server_clicks}/${total_clicks}) ELSE 0.0 END) ELSE (CASE WHEN 1.0*${ad_server_clicks} > 0 THEN 1.0 ELSE 0.0 END) END ;;
  }

  measure: ad_exchange_clicks_pcnt {
    type: number
    value_format: "0.00%"
    sql: CASE WHEN 1.0*${total_clicks} > 0 THEN (CASE WHEN 1.0*${ad_exchange_clicks} > 0 THEN 1.0*(${ad_exchange_clicks}/${total_clicks}) ELSE 0.0 END) ELSE (CASE WHEN 1.0*${ad_exchange_clicks} > 0 THEN 1.0 ELSE 0.0 END) END ;;
  }

  measure: unfilled_impressions_pcnt {
    type: number
    value_format: "0.00%"
    sql: CASE WHEN 1.0*${total_impressions} > 0 THEN (CASE WHEN 1.0*${unfilled_impressions} > 0 THEN 1.0*(${unfilled_impressions}/${total_impressions}) ELSE 0.0 END) ELSE (CASE WHEN 1.0*${unfilled_impressions} > 0 THEN 1.0 ELSE 0.0 END) END ;;
  }
}
