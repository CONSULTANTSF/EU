view: dfp_agg_viz {
  sql_table_name: SANDBOXQBIZ.DFP_AGG_VIZ ;;

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
    sql: ${TABLE}.PERIOD ;;
  }

  dimension_group: end {
    type: time
    timeframes: [date]
    sql: ${TABLE}.END_DATE ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}.SITE ;;
  }

  dimension: site_name {
    type: string
    sql: ${TABLE}.SITE_NAME ;;
  }

  dimension: page {
    type: string
    sql: ${TABLE}.PAGE ;;
  }

  dimension: page_name {
    type: string
    sql: ${TABLE}.PAGE_NAME ;;
  }

  dimension: placement {
    type: string
    sql: ${TABLE}.PLACEMENT ;;
  }

  dimension: placement_name {
    type: string
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

  measure: adex_clicks {
    type: sum
    sql: ${TABLE}.ADEX_CLICKS ;;
  }

  measure: adex_revenue {
    type: sum
    sql: ${TABLE}.ADEX_REVENUE ;;
  }

  measure: adex_view_imp {
    type: sum
    sql: ${TABLE}.ADEX_VIEW_IMP ;;
  }

  measure: adserv_clicks {
    type: sum
    sql: ${TABLE}.ADSERV_CLICKS ;;
  }

  measure: adserv_view_imp {
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

  measure: total_imp {
    type: sum
    sql: ${TABLE}.TOTAL_IMP ;;
  }

  measure: unfilled_imp {
    type: sum
    sql: ${TABLE}.UNFILLED_IMP ;;
  }

  measure: view_imp {
    type: sum
    sql: ${TABLE}.VIEW_IMP ;;
  }

  measure: count {
    type: count
    drill_fields: [placement_name, page_name, site_name]
  }

##@@@@@@@@@@
##@@@@@@@@@@
##CALCULATED MEASURES
##@@@@@@@@@@
##@@@@@@@@@@

  measure: vCTR {
    type: sum
    value_format: "0.00%"
    sql: CASE WHEN 1.0*{view_imp} > 0 THEN (CASE WHEN 1.0*{total_clicks} > 0 THEN 1.0*({total_clicks}/{view_imp}) ELSE 0.0 END) ELSE (CASE WHEN 1.0*{total_clicks} > 0 THEN 1.0 ELSE 0.0 END) END ;;
  }

}
