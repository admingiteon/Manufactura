
view: salida_cp_pt_inventario_lu_1 {
  derived_table: {
    sql: SELECT *,

      FROM `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_PT_Inventario_LU_1` ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: fecha {
    type: time
    sql: ${TABLE}.fecha ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: Tipo_Producto {
    type: string
    sql: ${TABLE}.tipo_producto ;;
  }


  dimension: Centro {
    type: string
    sql: SUBSTR(${TABLE}.id,20,10) ;;
  }


  dimension: posicion_actual {
    type: number
    sql: ${TABLE}.posicion_actual ;;
  }

  dimension: Cantidad_requerida {
    type: number
    sql: ${TABLE}.cantidad_requerida ;;
  }

  dimension: Cantidad {
    type: number
    sql: ${TABLE}.Cantidad ;;
  }

  dimension: stock_seguridad {
    type: number
    sql: ${TABLE}.stock_seguridad ;;
  }


  dimension: punto_pedido {
    type: number
    sql: ${TABLE}.punto_pedido ;;
  }

  dimension: tamano_lote_fabricacion {
    type: number
    sql: ${TABLE}.tamano_lote_fabricacion ;;
  }


  measure: Total_tamano_lote_fabricacion {
    label: "Tamaño lote Fabricaciòn"
    type: min
    sql: ${TABLE}.tamano_lote_fabricacion ;;
  }

  measure: Total_cantidad_requerida {
    label: "Fabricación"
    type: sum
    sql: ${TABLE}.cantidad_requerida ;;
  }

  measure: Total_punto_pedido {
    label: "Punto Pedido"
    type: min
    sql: ${TABLE}.punto_pedido ;;
  }


  measure: Total_stock_seguridad {
    label: "stock seguridad"
    type: min
    sql: ${TABLE}.stock_seguridad ;;
  }



  measure: Total_posicion_actual {
    label: "Inventario Inicial"
    type: min
    sql: ${TABLE}.posicion_actual ;;
  }

  measure: Total_Cantidad_requerida {
    type: sum
    sql: ${TABLE}.cantidad_requerida ;;
  }

  measure: Total_Cantidad {
    label: "Ventas"
    type: sum
    sql: ${TABLE}.Cantidad ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }

  set: detail {
    fields: [
        fecha_time,
  id,
  posicion_actual,
  Cantidad_requerida,
  Cantidad,
  material
    ]
  }
}
