view: lp_pt_inventario_lu_1_rec_2 {
  derived_table: {
    sql: select * from (
      select *, ROW_NUMBER() OVER (PARTITION BY fecha_rec, material_rec, centro_rec ORDER BY posicion_actual_rec DESC) as row_num from `psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Inventario_LU_1_rec_2`) a where a.row_num=1  ;;
  }

  dimension: cantidad_final_rec {
    type: number
    sql: ${TABLE}.cantidad_final_rec ;;
  }

  dimension: row_num {
    type: number
    sql: ${TABLE}.row_num ;;
  }

  dimension_group: fecha {
    type: time
    sql: ${TABLE}.fecha_rec ;;
  }


  dimension: cantidad_objetivo {
    type: number
    sql: ${TABLE}.cantidad_objetivo_rec ;;
  }
  dimension: cantidad {
    type: number
    sql: ${TABLE}.Cantidad_rec ;;
  }
  dimension: cantidad_requerida_rec {
    type: number
    sql: ${TABLE}.cantidad_requerida_rec ;;
  }

  measure: Total_cantidad_requerida {
    label: "Fabricación"
    type: sum
    sql: ${TABLE}.cantidad_requerida_rec_y ;;
    value_format: "#,##0"
  }


  dimension: cantidad_requerida_x {
    type: number
    sql: ${TABLE}.cantidad_requerida_rec_x ;;
  }
  dimension: cantidad_requerida_y {
    type: number
    sql: ${TABLE}.cantidad_requerida_rec_y ;;
  }
  dimension: centro_fabricacion {
    type: string
    sql: ${TABLE}.centro_fabricacion_rec ;;
  }
  dimension: centro {
    type: string
    sql: ${TABLE}.centro_rec ;;
  }
  dimension: cliente {
    type: string
    sql: ${TABLE}.cliente_rec ;;
  }
  dimension: fecha_inicio_produccion {
    type: string
    sql: ${TABLE}.fecha_inicio_produccion_rec ;;
  }
  dimension_group: fecha_rec {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.fecha_rec ;;
  }
  dimension: id {
    type: string
    sql: ${TABLE}.id_rec ;;
  }
  dimension: inventario_objetivo_proporcional_rec {
    type: number
    sql: ${TABLE}.Inventario_Objetivo_Proporcional_rec ;;
  }
  dimension: material {
    type: string
    sql: ${TABLE}.material_rec ;;
  }
  dimension: plazo_entrega_rec {
    type: number
    sql: ${TABLE}.plazo_entrega_rec ;;
  }
  dimension: posicion_actual {
    type: number
    sql: ${TABLE}.posicion_actual_rec ;;
  }

  measure: Total_posicion_actual {
    label: "Inventario Inicial"
    type: min
    sql: CASE WHEN ${TABLE}.row_num = 1 THEN ${TABLE}.posicion_actual_rec ELSE NULL END ;;
    value_format: "#,##0"
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

  measure: ventas {
    type: sum
    sql: ${TABLE}.Cantidad_rec ;;
  }

  dimension: stock_control_calidad {
    type: number
    sql: ${TABLE}.stock_control_calidad_rec ;;
  }
  dimension: stock_seguridad {
    type: number
    sql: ${TABLE}.stock_seguridad_rec ;;
  }

  measure: Total_tamano_lote_fabricacion {
    label: "Tamaño lote Fabricaciòn"
    type: min
    sql: ${TABLE}.tamano_lote_fabricacion_rec ;;
    value_format: "#,##0"
  }

  dimension: tamano_lote_fabricacion {
    type: number
    sql: ${TABLE}.tamano_lote_fabricacion_rec ;;
  }

  measure: count {
    type: count
  }
}
