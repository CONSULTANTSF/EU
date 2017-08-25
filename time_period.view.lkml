view: time_period {
  sql_table_name: SANDBOXQBIZ.TIME_PERIOD ;;

  dimension: compare_period {
    type: string
    sql: ${TABLE}.COMPARE_PERIOD ;;
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
    sql: ${TABLE}.end_date ;;
  }

  dimension_group: end_date_comp {
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
    sql: ${TABLE}.end_date_comp ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}.period ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_date ;;
  }

  dimension_group: start_date_comp {
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
    sql: ${TABLE}.start_date_comp ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
