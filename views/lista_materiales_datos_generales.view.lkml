view: lista_materiales_datos_generales {
  derived_table: {
    sql: SELECT * FROM `eon-bus-proj-cadena-demo.data_foundation.reporting_homologacion_mx_vw_cadena_suministro_datos_generales`
    WHERE SUBSTR(material,12,50) LIKE '4%' ;;
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

  set: detail {
    fields: [
      material,
      texto_breve_material
    ]
  }
}
