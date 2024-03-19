
view: pv_lp_insumo_inventario_1 {
  derived_table: {
    sql: SELECT * FROM `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_Insumo_Inventario_1`  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: Total_cantidad {
    type: sum
    sql: ${TABLE}.Cantidad ;;
  }

  measure: posicion_actual_max {
    label: "Posición Actual"
    type: max
    sql: ${TABLE}.posicion_actual ;;
  }

  dimension: sku {
    type: string
    sql: SUBSTR(${TABLE}.id,12,7) ;;
  }


  dimension: centro {
    type: string
    sql: SUBSTR(${TABLE}.id,20,4) ;;
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

  dimension_group: fecha {
    type: time
    sql: ${TABLE}.fecha ;;
  }

  dimension_group: fecha_inicio_produccion {
    type: time
    sql: ${TABLE}.fecha_inicio_produccion ;;
  }

  dimension: componente {
    type: string
    sql: ${TABLE}.Componente ;;
  }

  dimension: texto_breve_material {
    type: string
    sql: ${TABLE}.texto_breve_material ;;
  }

  dimension: unidad_medida {
    type: string
    sql: ${TABLE}.Unidad_Medida ;;
  }

  dimension: cantidadrequerida {
    type: number
    sql: ${TABLE}.cantidadrequerida ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: id_componente {
    type: string
    sql: ${TABLE}.id_componente ;;
  }

  dimension: centro_fabricacion {
    type: string
    sql: ${TABLE}.centro_fabricacion ;;
  }

  dimension: prioridad {
    type: number
    sql: ${TABLE}.Prioridad ;;
  }

  dimension: cantidad_componente {
    type: number
    sql: ${TABLE}.Cantidad_Componente ;;
  }

  dimension: lote {
    type: number
    sql: ${TABLE}.lote ;;
  }

  dimension: valor_redondeo {
    type: number
    sql: ${TABLE}.valor_redondeo ;;
  }

  dimension: plazo_entrega {
    type: number
    sql: ${TABLE}.plazo_entrega ;;
  }

  dimension: tiempo_tratamiento_entrada_mercancias {
    type: number
    sql: ${TABLE}.tiempo_tratamiento_entrada_mercancias ;;
  }

  dimension: posicion_actual {
    type: number
    sql: ${TABLE}.posicion_actual ;;
  }

  dimension: cantidad_requerida {
    type: number
    sql: ${TABLE}.cantidad_requerida ;;
  }

  dimension_group: fecha_orden_de_compra {
    type: time
    sql: ${TABLE}.fecha_orden_de_compra ;;
  }

  dimension: fecha_orden_de_compra_dim {
    type: date
    sql: ${TABLE}.fecha_orden_de_compra ;;
  }


  dimension: producible {
    type: yesno
    sql: CASE
          WHEN ${posicion_actual} > ${cantidad_requerida} THEN TRUE
          WHEN ${posicion_actual} < ${cantidad_requerida} AND ${fecha_orden_de_compra_dim} > CURRENT_DATE THEN TRUE
          WHEN ${posicion_actual} < ${cantidad_requerida} AND ${fecha_orden_de_compra_dim} <= CURRENT_DATE THEN FALSE
          ELSE FALSE
        END ;;
  }


  set: detail {
    fields: [
        fecha_time,
  fecha_inicio_produccion_time,
  componente,
  texto_breve_material,
  unidad_medida,
  cantidadrequerida,
  id,
  id_componente,
  centro_fabricacion,
  prioridad,
  cantidad_componente,
  lote,
  valor_redondeo,
  plazo_entrega,
  tiempo_tratamiento_entrada_mercancias,
  posicion_actual,
  cantidad_requerida,
  fecha_orden_de_compra_time
    ]
  }
}
