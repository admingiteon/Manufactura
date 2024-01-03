
view: tb_corto_plazo_fabricacion {
  derived_table: {
    sql: select * from psa-psa-cadena-qa.reporting_ecc_mx.tb_corto_plazo_fabricacion ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: sociedad {
    type: string
    sql: ${TABLE}.sociedad ;;
  }

  dimension_group: fecha {
    type: time
    sql: ${TABLE}.fecha ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }

  dimension: componente {
    type: string
    sql: ${TABLE}.Componente ;;
  }

  dimension: prioridad {
    type: number
    sql: ${TABLE}.Prioridad ;;
  }

  dimension: cliente {
    type: string
    sql: ${TABLE}.cliente ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: centro_suministrador {
    type: string
    sql: ${TABLE}.centro_suministrador ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
  }

  dimension: num_material {
    type: string
    sql: ${TABLE}.num_material ;;
  }

  dimension: cantidad_requerida {
    type: number
    sql: ${TABLE}.cantidad_requerida ;;
  }

  dimension: velocidad_fabricacion {
    type: number
    sql: ${TABLE}.velocidad_fabricacion ;;
  }

  dimension: puesto_trabajo {
    type: string
    sql: ${TABLE}.puesto_trabajo ;;
  }

  dimension: texto_breve_operacion {
    type: string
    sql: ${TABLE}.texto_breve_operacion ;;
  }

  dimension: planta {
    type: string
    sql: ${TABLE}.planta ;;
  }

  dimension: horas_requeridas {
    type: number
    sql: ${TABLE}.horas_requeridas ;;
  }

  dimension: horas {
    type: number
    sql: ${TABLE}.horas ;;
  }

  dimension: semana_del_ao {
    type: number
    sql: ${TABLE}.`semana_del_año` ;;
  }

  dimension: horas_disponibles_semanal {
    type: number
    sql: ${TABLE}.horas_disponibles_semanal ;;
  }

  dimension: material_fecha {
    type: string
    sql: ${TABLE}.material_fecha ;;
  }

  dimension: cantidad_producible {
    type: number
    sql: ${TABLE}.cantidad_producible ;;
  }

  dimension: horas_restantes {
    type: number
    sql: ${TABLE}.horas_restantes ;;
  }

  dimension: producible {
    type: number
    sql: ${TABLE}.producible ;;
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}.tipo ;;
  }

  set: detail {
    fields: [
        sociedad,
  fecha_time,
  material,
  componente,
  prioridad,
  cliente,
  id,
  centro_suministrador,
  centro,
  num_material,
  cantidad_requerida,
  velocidad_fabricacion,
  puesto_trabajo,
  texto_breve_operacion,
  planta,
  horas_requeridas,
  horas,
  semana_del_ao,
  horas_disponibles_semanal,
  material_fecha,
  cantidad_producible,
  horas_restantes,
  producible,
  tipo
    ]
  }
}
