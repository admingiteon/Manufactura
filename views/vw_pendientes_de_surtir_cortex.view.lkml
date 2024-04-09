view: vw_pendientes_de_surtir_cortex {
  derived_table: {
    sql: SELECT *
        FROM
            `eon-bus-proj-cadena-demo.reporting_manufactura.vw_pendientes_de_surtir_cortex`
      WHERE {% condition material %} material {% endcondition %}
      ;;
  }

  dimension: cantidad_requerida {
    type: number
    sql: ${TABLE}.cantidad_requerida ;;
  }


  measure: total_cantidad_requerida {
    type: sum
    sql: COALESCE(${cantidad_requerida},0) ;;  }


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

  dimension_group: fecha_inicio {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fecha_inicio ;;
  }

  measure: inventario_pt {
    type: sum
    sql: COALESCE(${TABLE}.inventario_pt,0) ;;
  }

  dimension: margen {
    type: number
    sql: ${TABLE}.margen ;;
  }

  dimension: material {
    type: string
    sql: SUBSTR(${TABLE}.material,12,50) ;;
  }

  dimension: npedido {
    label: "Pedido"
    type: string
    sql: ${TABLE}.npedido ;;
  }

  dimension: periodo {
    type: string
    sql: ${TABLE}.periodo ;;
  }

  measure: porcentaje_cobertura {
    type: average
    value_format: "0\%"
    sql: COALESCE(${TABLE}.porcentaje_cobertura,0) ;;
  }

  dimension: precio_venta {
    type: number
    sql: ${TABLE}.precio_venta ;;
  }

  dimension: texto_breve_material {
    label: "Descripción "
    type: string
    sql: ${TABLE}.texto_breve_material ;;
  }
  measure: count {
    type: count
  }
}
