connection: "eu"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

## explore: dfp_comp_viz {}

explore: dfp_comp_viz {
  join: time_period {
    type: inner
    sql_on: ${dfp_comp_viz.end_date} = ${time_period.end_date} AND  ${dfp_comp_viz.period} = ${time_period.period};;
    relationship: one_to_many
  }
  join: add_dim {
    type: inner
    sql_on: ${dfp_comp_viz.ad_unit} = ${add_dim.ad_unit};;
    relationship: one_to_many
  }
  }
