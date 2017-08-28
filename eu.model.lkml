connection: "eu"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

# Includes KPIs sliced by site/page/placement, relative to a particular period and end_date
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

# Includes KPIs sliced by site/page/placement and date, relative to a particular period and end_date
explore: daily_kpis {
  from: dfp_imp_daily_viz
  join: time_period {
    type: inner
    sql_on: ${daily_kpis.end_date} = ${time_period.end_date} AND  ${daily_kpis.period} = ${time_period.period};;
    relationship: many_to_one
  }
  join: add_dim {
    type: inner
    sql_on: ${daily_kpis.ad_unit} = ${add_dim.ad_unit};;
    relationship: many_to_one
  }
}

# Includes KPIs sliced by site/page/placement and ad request size, relative to a particular period and end_date
explore: ad_request_size_kpis {
  from: dfp_unfilled_viz
  join: time_period {
    type: inner
    sql_on: ${ad_request_size_kpis.end_date} = ${time_period.end_date} AND  ${ad_request_size_kpis.period} = ${time_period.period};;
    relationship: many_to_one
  }
  join: add_dim {
    type: inner
    sql_on: ${ad_request_size_kpis.ad_unit} = ${add_dim.ad_unit};;
    relationship: many_to_one
  }
}

# Includes Current-period and Previous-period KPIs sliced by site/page/placement, relative to a particular period and end_date
explore: current_vs_previous_kpis {
  from: dfp_delta
  join: time_period {
    type: inner
    sql_on: ${current_vs_previous_kpis.end_date} = ${time_period.end_date} AND  ${current_vs_previous_kpis.period} = ${time_period.period};;
    relationship: many_to_one
  }
  join: add_dim {
    type: inner
    sql_on: ${current_vs_previous_kpis.ad_unit} = ${add_dim.ad_unit};;
    relationship: many_to_one
  }
}

# View below is currently hidden
# explore: compare_kpis {
#   from: dfp_comp_viz
#   join: time_period {
#     type: inner
#     sql_on: ${compare_kpis.end_date} = ${time_period.end_date} AND  ${compare_kpis.period} = ${time_period.period};;
#     relationship: many_to_one
#   }
#   join: add_dim {
#     type: inner
#     sql_on: ${compare_kpis.ad_unit} = ${add_dim.ad_unit};;
#     relationship: many_to_one
#   }
# }
