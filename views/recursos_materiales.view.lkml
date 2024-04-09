view: recursos_materiales {

  derived_table: {
    sql: SELECT * FROM `eon-bus-proj-cadena-demo.entradas_y_salidas.recursos_materiales`
    WHERE SUBSTR(num_material,12,50) LIKE '4%';;
    }

  dimension: cantidad_base {
    type: number
    sql: ${TABLE}.cantidad_base ;;
  }


  measure: total_cantidad_base {
    type: sum
    sql: ${cantidad_base} ;;  }

  measure: average_cantidad_base {
    type: average
    sql: ${cantidad_base} ;;  }

  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
  }

  dimension: id_recurso {
    label: "Recurso"
    type: string
    sql: ${TABLE}.id_recurso ;;
  }

  dimension: material {
    type: string
    sql:  SUBSTR(${TABLE}.num_material,12,50)  ;;
  }

  dimension: num_operacion {
    type: string
    sql: ${TABLE}.num_operacion ;;
  }

  dimension: puesto_trabajo {
    type: string
    sql: ${TABLE}.puesto_trabajo ;;
  }

  dimension: tamano_lote_a {
    type: number
    sql: ${TABLE}.tamano_lote_a ;;
  }

  dimension: tamano_lote_de {
    type: number
    sql: ${TABLE}.tamano_lote_de ;;
  }

  dimension: texto_breve_operacion {
    label: "Nombre de recurso"
    type: string
    sql: ${TABLE}.texto_breve_operacion ;;
  }

  dimension: tiempo_fabricacion_lote {
    type: number
    sql: ${TABLE}.tiempo_fabricacion_lote ;;
  }

  dimension: tiempo_total_fabricacion_lote {
    label: "Velocidad de fabricación (Horas)"
    value_format: "#,##0.00"
    type: number
    sql: COALESCE(${TABLE}.tiempo_total_fabricacion_lote,0) ;;
    html: {{ rendered_value }} hrs
    ;;
  }

  dimension: velocidad_fabricacion {
    type: number
    sql: ${TABLE}.velocidad_fabricacion ;;
  }
  measure: count {
    type: count
  }
}
