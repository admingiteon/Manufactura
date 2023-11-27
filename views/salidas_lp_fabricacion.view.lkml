
view: salidas_lp_fabricacion {
  derived_table: {
    sql: select * from psa-psa-cadena-qa.modelo_de_calculo.fabricacion limit 1000 ;;
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
	fecha_inicio_produccion_time,
	cantidad_fabricar
    ]
  }
}
