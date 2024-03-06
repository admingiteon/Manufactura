
view: salidas_lp_insumo_inventario_1 {
  derived_table: {
    sql: select  * from `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_Insumo_Inventario_1`  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  dimension: componente {
    type: string
    sql: ${TABLE}.Componente ;;
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }


  dimension_group: fecha {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.fecha ;;
  }


  dimension_group: fecha_inicio_produccion {
    type: time
    sql: ${TABLE}.fecha_inicio_produccion ;;
  }

  dimension_group: fecha_orden_de_compra {
    type: time
    sql: ${TABLE}.fecha_orden_de_compra ;;
  }

  dimension: posicion_actual {
    type: number
    sql: ${TABLE}.posicion_actual ;;
  }

  dimension: Material {
    type: string
    sql: SUBSTR(${TABLE}.id,1,18) ;;
  }

  dimension: Centro {
    type: string
    sql: SUBSTR(${TABLE}.id,20,10) ;;
  }


  dimension: unidad_de_medida {
    type: string
    sql: ${TABLE}.Unidad_Medida ;;
  }

  dimension: prioridad {
    type: string
    sql: ${TABLE}.Prioridad ;;
  }

  dimension: necesidad {
    type: string
    sql: ${TABLE}.necesidad ;;
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

  dimension: Total_cantidad_requerida_Insumo {
    label: "Cantidad Requerida Insumos Inventario"
    type: number
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

  set: detail {
    fields: [
        componente,
  id,
  fecha_inicio_produccion_time,
  fecha_orden_de_compra_time,
  posicion_actual
    ]
  }
}
