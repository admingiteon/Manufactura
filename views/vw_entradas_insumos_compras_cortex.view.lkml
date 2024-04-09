# The name of this view in Looker is "Vw Entradas Insumos Compras Cortex"
view: vw_entradas_insumos_compras_cortex {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `eon-bus-proj-cadena-demo.reporting_manufactura.vw_entradas_insumos_compras_cortex` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cantidad" in Explore.

  dimension: cantidad {
    type: number
    sql: ${TABLE}.cantidad ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cantidad {
    type: sum
    sql: ${cantidad} ;;  }
  measure: average_cantidad {
    type: average
    sql: ${cantidad} ;;  }

  dimension: componente {
    type: string
    sql: ${TABLE}.componente ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: fecha_entrega {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fecha_entrega ;;
  }

  dimension_group: fecha_solicitud {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fecha_solicitud ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }

  dimension: nombre_insumo {
    type: string
    sql: ${TABLE}.nombre_insumo ;;
  }

  dimension: plazo_entrega {
    type: number
    sql: ${TABLE}.plazo_entrega ;;
  }

  dimension: unidad_medida {
    type: string
    sql: ${TABLE}.unidad_medida ;;
  }
  measure: count {
    type: count
  }
}
