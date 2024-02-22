
view: salidas_lp_pt_inventario_lu_1 {
  derived_table: {
    sql: select * from (
select *, ROW_NUMBER() OVER (PARTITION BY fecha, material, centro ORDER BY posicion_actual DESC) as row_num from `psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Inventario_LU_1`) a  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: row_num {
    type: number
    sql: ${TABLE}.row_num ;;
  }

  dimension_group: fecha {
    type: time
    sql: ${TABLE}.fecha ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: Centro {
    type: string
    sql: ${TABLE}.centro ;;
  }

  dimension: Material {
    type: string
    sql: ${TABLE}.material ;;
  }

  measure: ventas {
    type: sum
    sql: ${TABLE}.Cantidad ;;
    drill_fields: [detail*]
  }


  measure: Total_posicion_actual {
    label: "Inventario Inicial"
    type: min
    sql: CASE WHEN ${TABLE}.row_num = 1 THEN ${TABLE}.posicion_actual ELSE NULL END ;;
    value_format: "#,##0"
  }

  measure: Total_cantidad_requerida {
    label: "Fabricación"
    type: sum
    sql: ${TABLE}.cantidad_requerida ;;
    value_format: "#,##0"
  }

  measure: Total_tamano_lote_fabricacion {
    label: "Tamaño lote Fabricaciòn"
    type: min
    sql: ${TABLE}.tamano_lote_fabricacion ;;
    value_format: "#,##0"
  }


  dimension: cantidad {
    type: number
    sql: ${TABLE}.Cantidad ;;
  }

  dimension: posicion_actual {
    type: number
    sql: ${TABLE}.posicion_actual ;;
  }

  dimension: inventario_objetivo_proporcional {
    type: number
    sql: ${TABLE}.Inventario_Objetivo_Proporcional ;;
  }

  dimension: punto_pedido {
    type: number
    sql: ${TABLE}.punto_pedido ;;
  }

  dimension: cantidad_requerida {
    type: number
    sql: ${TABLE}.cantidad_requerida ;;
  }

  dimension: stock_seguridad {
    type: number
    sql: ${TABLE}.stock_seguridad ;;
  }

  dimension: tamano_lote_fabricacion {
    type: number
    sql: ${TABLE}.tamano_lote_fabricacion ;;
  }

  dimension_group: fecha_inicio_produccion {
    label: "fecha inicio produccion"
    type: time
    sql: ${TABLE}.fecha_inicio_produccion ;;
  }

  set: detail {
    fields: [
        fecha_time,
  id,
  cantidad,
  posicion_actual,
  inventario_objetivo_proporcional,
  punto_pedido,
  cantidad_requerida,
  stock_seguridad,
  tamano_lote_fabricacion,
  fecha_inicio_produccion_time
    ]
  }
}
