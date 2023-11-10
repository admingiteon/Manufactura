
view: salida_cp_pt_inventario_lu_1 {
  derived_table: {
    sql: SELECT *,
      substring(id,1,18) as material
      FROM `psa-psa-cadena-qa.modelo_de_calculo.CP_PT_Inventario_LU_1` ;;
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
