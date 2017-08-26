connection: "eu"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: compare_kpis {
  from: dfp_comp_viz
  join: time_period {
    type: inner
    sql_on: ${compare_kpis.end_date} = ${time_period.end_date} AND  ${compare_kpis.period} = ${time_period.period};;
    relationship: many_to_one
  }
  join: add_dim {
    type: inner
    sql_on: ${compare_kpis.ad_unit} = ${add_dim.ad_unit};;
    relationship: many_to_one
  }
}

explore: aggregate_kpis {
  from: dfp_agg_viz
  join: time_period {
    type: inner
    sql_on: ${aggregate_kpis.end_date} = ${time_period.end_date} AND  ${aggregate_kpis.period} = ${time_period.period};;
    relationship: many_to_one
  }
  join: add_dim {
    type: inner
    sql_on: ${aggregate_kpis.ad_unit} = ${add_dim.ad_unit};;
    relationship: many_to_one
  }
}
