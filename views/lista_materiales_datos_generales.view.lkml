view: lista_materiales_datos_generales {
  derived_table: {
    sql: SELECT * FROM `eon-bus-proj-cadena-demo.data_foundation.reporting_homologacion_mx_vw_cadena_suministro_datos_generales`
    WHERE SUBSTR(material,12,50) LIKE '4%' AND centro in ('Sinaloa',
'Cd-Juarez',
'Cuautitlan',
'Guadalajara',
'CDMX-Vallejo') ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: material {
    type: string
    sql: SUBSTR(${TABLE}.material,12,50) ;;
  }

  dimension: texto_breve_material {
    type: string
    sql: ${TABLE}.texto_breve_material ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
  }

  measure: stock_de_seguridad {
    type: max
    sql: ${TABLE}.stock_seguridad ;;
  }

  measure: stock_libre_utilizacion {
    type: sum
    sql: ${TABLE}.stock_libre_utilizacion ;;
  }

  measure: stock_traslado {
    type: sum
    sql: ${TABLE}.stock_traslado ;;
  }

  measure: stock_control_calidad {
    type: sum
    sql: ${TABLE}.stock_control_calidad ;;
  }

  measure: tiempo_tratamiento_entrada_mercancias {
    type: max
    sql: ${TABLE}.tiempo_tratamiento_entrada_mercancias ;;
    html: {{ rendered_value }} hrs
    ;;
  }

  set: detail {
    fields: [
      material,
      texto_breve_material
    ]
  }
}
