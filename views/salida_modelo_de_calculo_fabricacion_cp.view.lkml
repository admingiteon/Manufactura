
view: salida_modelo_de_calculo_fabricacion_cp {
  derived_table: {
    sql: SELECT * FROM `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_PT_Fabricacion_1` ;;
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
     sql: SUBSTR(${TABLE}.id,20,10) ;;
  }

  dimension: cliente {
    type: string
    sql: ${TABLE}.cliente ;;
  }

  dimension_group: fecha_inicio_produccion {
    type: time
    sql: ${TABLE}.fecha ;;
  }

  dimension: cantidad_requerida {
    type: number
    sql: ${TABLE}.cantidad_requerida ;;
  }

  set: detail {
    fields: [
        id,
  documento,
  material,
  centro,
  cliente,
  fecha_inicio_produccion_time,
  cantidad_requerida
    ]
  }
}
