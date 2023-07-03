view: vw_cadena_suministro_pedidos_venta {
  sql_table_name: `reporting_ecc_mx.vw_cadena_suministro_pedidos_venta` ;;

  dimension: cantidad_pedido {
    type: number
    sql: ${TABLE}.cantidad_pedido ;;
  }
  dimension: clase_doc_ventas {
    type: string
    sql: ${TABLE}.clase_doc_ventas ;;
  }
  dimension: doc_ventas {
    type: string
    sql: ${TABLE}.doc_ventas ;;
  }
  dimension_group: fecha_creacion_registro {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fechaCreacion_registro ;;
  }
  dimension: grupo_articulos {
    type: string
    sql: ${TABLE}.grupo_articulos ;;
  }
  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }
  dimension: moneda {
    type: string
    sql: ${TABLE}.moneda ;;
  }
  dimension: org_ventas {
    type: string
    sql: ${TABLE}.org_ventas ;;
  }
  dimension: posicion {
    type: string
    sql: ${TABLE}.posicion ;;
  }
  dimension: sector {
    type: string
    sql: ${TABLE}.sector ;;
  }
  dimension: solicitante {
    type: string
    sql: ${TABLE}.solicitante ;;
  }
  dimension: texto_breve {
    type: string
    sql: ${TABLE}.texto_breve ;;
  }
  dimension: tipo_cambio {
    type: number
    sql: ${TABLE}.tipo_cambio ;;
  }
  dimension: valor_neto_pedido {
    type: number
    sql: ${TABLE}.valor_neto_pedido ;;
  }
  dimension: valor_posicion {
    type: number
    sql: ${TABLE}.valor_posicion ;;
  }
  measure: count {
    type: count
  }
}
