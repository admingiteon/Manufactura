
view: pv_lp_pt_fabricados_inventario_lu_1 {
  derived_table: {
    sql: SELECT * FROM `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_PT_Fabricados_Inventario_LU_1` ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: Total_cantidad {
    type: sum
    sql: ${TABLE}.Cantidad ;;
  }

  measure: Total_cantidad_requerida {
    label: "Cantidad Requerida"
    type: sum
    sql: ${TABLE}.cantidad_requerida ;;
  }

  dimension: sku {
    type: string
    sql: SUBSTR(${TABLE}.material,12,7) ;;
  }


  dimension_group: Fecha_creacion {
    type: time

    timeframes: [
      raw,
      time,
      hour_of_day,
      date,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year,
      week,
      week_of_year,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    sql: cast(${TABLE}.fecha AS TIMESTAMP) ;;
    convert_tz: no
  }

  dimension: sociedad {
    type: string
    sql: ${TABLE}.sociedad ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }

  dimension: cantidad {
    type: number
    sql: ${TABLE}.Cantidad ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
  }

  dimension: centro_fabricacion {
    type: string
    sql: ${TABLE}.centro_fabricacion ;;
  }

  dimension: prioridad {
    type: number
    sql: ${TABLE}.Prioridad ;;
  }

  dimension: inventario_objetivo_proporcional {
    type: number
    sql: ${TABLE}.Inventario_Objetivo_Proporcional ;;
  }

  dimension_group: fecha {
    type: time
    sql: ${TABLE}.fecha ;;
  }

  dimension: plazo_entrega {
    type: number
    sql: ${TABLE}.plazo_entrega ;;
  }

  dimension: stock_seguridad {
    type: number
    sql: ${TABLE}.stock_seguridad ;;
  }

  dimension: stock_control_calidad {
    type: number
    sql: ${TABLE}.stock_control_calidad ;;
  }

  dimension: posicion_actual {
    type: number
    sql: ${TABLE}.posicion_actual ;;
  }

  dimension: posicion_objetivo {
    type: number
    sql: ${TABLE}.posicion_objetivo ;;
  }

  dimension: tipo_producto {
    type: string
    sql: ${TABLE}.tipo_producto ;;
  }

  dimension: cantidad_requerida {
    type: number
    sql: ${TABLE}.cantidad_requerida ;;
  }

  dimension: cantidad_objetivo {
    type: number
    sql: ${TABLE}.cantidad_objetivo ;;
  }

  dimension: cantidad_final {
    type: number
    sql: ${TABLE}.cantidad_final ;;
  }

  dimension: tamano_lote_fabricacion {
    type: number
    sql: ${TABLE}.tamano_lote_fabricacion ;;
  }

  dimension_group: fecha_inicio_produccion {
    type: time
    sql: ${TABLE}.fecha_inicio_produccion ;;
  }

  dimension: recurso {
    type: string
    sql: ${TABLE}.recurso ;;
  }

  set: detail {
    fields: [
        sociedad,
  id,
  material,
  cantidad,
  centro,
  centro_fabricacion,
  prioridad,
  inventario_objetivo_proporcional,
  fecha_time,
  plazo_entrega,
  stock_seguridad,
  stock_control_calidad,
  posicion_actual,
  posicion_objetivo,
  tipo_producto,
  cantidad_requerida,
  cantidad_objetivo,
  cantidad_final,
  tamano_lote_fabricacion,
  fecha_inicio_produccion_time,
  recurso
    ]
  }
}
