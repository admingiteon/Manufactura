
view: salidas_lp_fabricacion {
  derived_table: {
    sql: select * from `psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Fabricacion_1`  ;;
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
