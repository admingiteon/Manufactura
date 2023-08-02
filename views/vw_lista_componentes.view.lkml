#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines



view: vw_lista_componentes {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.reporting_ecc_mx.vw_lista_componentes` ;;
  }

  measure: count {
    type: count
   # drill_fields: [listacomponentes*]
  }

  dimension: periodo {
    type: string
    sql: ${TABLE}.periodo ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: componente_nivel2 {
    type: string
    sql: ${TABLE}.componente_nivel2 ;;
  }

  dimension: texto_breve_material_nivel2 {
    type: string
    sql: ${TABLE}.Texto_breve_material_nivel2 ;;
  }

  dimension: cantidad {
    type: number
    sql: ${TABLE}.cantidad ;;
  }

  set: listacomponentes {
    fields: [
      periodo,
      sku,
      componente_nivel2,
      texto_breve_material_nivel2,
      cantidad
    ]
  }
}
