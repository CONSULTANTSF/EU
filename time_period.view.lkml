view: time_period {
  sql_table_name: SANDBOXQBIZ.TIME_PERIOD ;;

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    sql: sql: CONCAT(${TABLE}."period", '  ', LEFT(${TABLE}."end_date",10)) ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}."period" ;;
  }

  dimension_group: end {
    type: time
    timeframes: [date]
    sql: ${TABLE}."end_date" ;;
  }

#   dimension: compare_period {
#     type: string
#     sql: ${TABLE}.COMPARE_PERIOD ;;
#   }

#   dimension_group: end_date_comp {
#     type: time
#     timeframes: [date]
#     sql: ${TABLE}.end_date_comp ;;
#   }

#   dimension_group: start {
#     type: time
#     timeframes: [date]
#     sql: ${TABLE}.start_date ;;
#   }

#   dimension_group: start_date_comp {
#     type: time
#     timeframes: [date]
#     sql: ${TABLE}.start_date_comp ;;
#   }

#   measure: count {
#     type: count
#     drill_fields: []
#   }
}
