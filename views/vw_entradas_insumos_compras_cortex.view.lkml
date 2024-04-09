view: vw_entradas_insumos_compras_cortex {

  derived_table: {
    sql: SELECT * FROM `eon-bus-proj-cadena-demo.reporting_manufactura.vw_entradas_insumos_compras_cortex`
      WHERE SUBSTR(material,12,50) LIKE '4%' ;;
  }


  dimension: cantidad {
    type: number
    sql: ${TABLE}.cantidad ;;
  }

  measure: total_cantidad {
    label: "Cantidad"
    value_format: "#,##0"
    type: sum
    sql: ${cantidad} ;;  }
  measure: average_cantidad {
    type: average
    sql: ${cantidad} ;;  }

  dimension: componente {
    label: "Insumo"
    type: string
    sql:  SUBSTR(${TABLE}.componente,12,50) ;;
  }

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
    sql:  SUBSTR(${TABLE}.material,12,50) ;;
  }

  dimension: nombre_insumo {
    type: string
    sql: ${TABLE}.nombre_insumo ;;
  }

  measure: plazo_entrega {
    type: max
    sql: ${TABLE}.plazo_entrega ;;
    html: {{ rendered_value }} hrs
    ;;
  }

  dimension: unidad_medida {
    label: "Unidad de Medida"
    type: string
    sql: ${TABLE}.unidad_medida ;;
  }
  measure: count {
    type: count
  }
}
