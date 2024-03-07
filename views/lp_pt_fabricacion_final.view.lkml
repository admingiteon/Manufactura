
view: lp_pt_fabricacion_final {
  derived_table: {
    sql: select * from `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_PT_Fabricacion_Final` ;;
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

  dimension: mes_ano {
    type: string
    sql: ${TABLE}.mes_ano ;;
  }

  dimension: horas_disponibles_mensual {
    type: number
    sql: ${TABLE}.horas_disponibles_mensual ;;
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
	mes_ano,
	horas_disponibles_mensual,
	material_fecha,
	cantidad_producible,
	horas_restantes,
	producible,
	tipo
    ]
  }
}
