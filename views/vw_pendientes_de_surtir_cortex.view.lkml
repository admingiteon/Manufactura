view: vw_pendientes_de_surtir_cortex {
  sql_table_name: `eon-bus-proj-cadena-demo.reporting_manufactura.vw_pendientes_de_surtir_cortex` ;;


  dimension: cantidad_requerida {
    type: number
    sql: ${TABLE}.cantidad_requerida ;;
  }


  measure: total_cantidad_requerida {
    type: sum
    sql: ${cantidad_requerida} ;;  }
  measure: average_cantidad_requerida {
    type: average
    sql: ${cantidad_requerida} ;;  }

  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
  }

  dimension: cliente {
    type: string
    sql: ${TABLE}.cliente ;;
  }

  dimension: costo_produccion {
    type: number
    sql: ${TABLE}.costo_produccion ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: fecha_inicio {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fecha_inicio ;;
  }

  dimension: inventario_pt {
    type: number
    sql: ${TABLE}.inventario_pt ;;
  }

  dimension: margen {
    type: number
    sql: ${TABLE}.margen ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }

  dimension: npedido {
    type: string
    sql: ${TABLE}.npedido ;;
  }

  dimension: periodo {
    type: string
    sql: ${TABLE}.periodo ;;
  }

  dimension: porcentaje_cobertura {
    type: number
    sql: ${TABLE}.porcentaje_cobertura ;;
  }

  dimension: precio_venta {
    type: number
    sql: ${TABLE}.precio_venta ;;
  }

  dimension: texto_breve_material {
    type: string
    sql: ${TABLE}.texto_breve_material ;;
  }
  measure: count {
    type: count
  }
}
