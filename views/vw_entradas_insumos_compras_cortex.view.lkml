view: vw_entradas_insumos_compras_cortex {

  sql_table_name: `eon-bus-proj-cadena-demo.reporting_manufactura.vw_entradas_insumos_compras_cortex` ;;


  dimension: cantidad {
    type: number
    sql: ${TABLE}.cantidad ;;
  }


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
