
view: salidas_lp_fabricacion {
  derived_table: {
    sql: select * from `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_PT_Inventario_LU_1`  ;;



  }

  dimension_group: fecha {
    type: time
    sql: ${TABLE}.fecha ;;
  }

  dimension_group: fecha_inicio_produccion {
    type: time
    sql: ${TABLE}.fecha_inicio_produccion ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: documento {
    type: string
    sql: ${TABLE}.documento ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
  }



  dimension:  cantidad_requerida {
    type: number
    sql: ${TABLE}.cantidad_requerida ;;
  }








  set: detail {
    fields: [
        id,
  documento,
  material,
  centro,


    ]
  }
}
