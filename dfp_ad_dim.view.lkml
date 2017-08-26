view: add_dim {
  sql_table_name: SANDBOXQBIZ.ADD_DIM ;;

  dimension: ad_unit {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.AD_UNIT ;;
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

  dimension: site {
    type: string
    sql: ${TABLE}.SITE ;;
  }

  dimension: site_name {
    type: string
    sql: ${TABLE}.SITE_NAME ;;
  }

  measure: count {
    type: count
    drill_fields: [page_name, placement_name, site_name]
  }
}
