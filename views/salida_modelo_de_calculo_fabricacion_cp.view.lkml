
view: salida_modelo_de_calculo_fabricacion_cp {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.modelo_de_calculo.CP_PT_Fabricacion_1` ;;
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
    sql:  SUBSTR(${TABLE}.id,1,18) ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
  }

  dimension: cliente {
    type: string
    sql: ${TABLE}.cliente ;;
  }

  dimension_group: fecha_inicio_produccion {
    type: time
    sql: ${TABLE}.fecha_inicio_produccion ;;
  }

  dimension: cantidad_fabricar {
    type: number
    sql: ${TABLE}.cantidad_fabricar ;;
  }

  set: detail {
    fields: [
        id,
  documento,
  material,
  centro,
  cliente,
  fecha_inicio_produccion_time,
  cantidad_fabricar
    ]
  }
}
