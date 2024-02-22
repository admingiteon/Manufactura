view: lp_pt_inventario_lu_1_rec_2 {
  sql_table_name: `psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Inventario_LU_1_rec_2` ;;

  dimension: cantidad_final_rec {
    type: number
    sql: ${TABLE}.cantidad_final_rec ;;
  }
  dimension: cantidad_objetivo_rec {
    type: number
    sql: ${TABLE}.cantidad_objetivo_rec ;;
  }
  dimension: cantidad_rec {
    type: number
    sql: ${TABLE}.Cantidad_rec ;;
  }
  dimension: cantidad_requerida_rec {
    type: number
    sql: ${TABLE}.cantidad_requerida_rec ;;
  }
  dimension: cantidad_requerida_rec_x {
    type: number
    sql: ${TABLE}.cantidad_requerida_rec_x ;;
  }
  dimension: cantidad_requerida_rec_y {
    type: number
    sql: ${TABLE}.cantidad_requerida_rec_y ;;
  }
  dimension: centro_fabricacion_rec {
    type: string
    sql: ${TABLE}.centro_fabricacion_rec ;;
  }
  dimension: centro_rec {
    type: string
    sql: ${TABLE}.centro_rec ;;
  }
  dimension: cliente_rec {
    type: string
    sql: ${TABLE}.cliente_rec ;;
  }
  dimension: fecha_inicio_produccion_rec {
    type: string
    sql: ${TABLE}.fecha_inicio_produccion_rec ;;
  }
  dimension_group: fecha_rec {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.fecha_rec ;;
  }
  dimension: id_rec {
    type: string
    sql: ${TABLE}.id_rec ;;
  }
  dimension: inventario_objetivo_proporcional_rec {
    type: number
    sql: ${TABLE}.Inventario_Objetivo_Proporcional_rec ;;
  }
  dimension: material_rec {
    type: string
    sql: ${TABLE}.material_rec ;;
  }
  dimension: plazo_entrega_rec {
    type: number
    sql: ${TABLE}.plazo_entrega_rec ;;
  }
  dimension: posicion_actual_rec {
    type: number
    sql: ${TABLE}.posicion_actual_rec ;;
  }
  dimension: posicion_objetivo_rec {
    type: number
    sql: ${TABLE}.posicion_objetivo_rec ;;
  }
  dimension: prioridad_cliente_rec {
    type: number
    sql: ${TABLE}.prioridad_cliente_rec ;;
  }
  dimension: prioridad_rec {
    type: number
    sql: ${TABLE}.Prioridad_rec ;;
  }
  dimension: recurso {
    type: string
    sql: ${TABLE}.recurso ;;
  }
  dimension: sociedad_rec {
    type: string
    sql: ${TABLE}.sociedad_rec ;;
  }
  dimension: stock_control_calidad_rec {
    type: number
    sql: ${TABLE}.stock_control_calidad_rec ;;
  }
  dimension: stock_seguridad_rec {
    type: number
    sql: ${TABLE}.stock_seguridad_rec ;;
  }
  dimension: tamano_lote_fabricacion_rec {
    type: number
    sql: ${TABLE}.tamano_lote_fabricacion_rec ;;
  }
  dimension: tipo_producto_rec {
    type: string
    sql: ${TABLE}.tipo_producto_rec ;;
  }
  measure: count {
    type: count
  }
}
