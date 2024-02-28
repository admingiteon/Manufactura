#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines



view: vw_largo_plazo_trazabilidad_ant {
  derived_table: {
    sql: SELECT * FROM `psa-sga-dfn-qa.reporting_ecc_mx.vw_Largo_Plazo_Traza`  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_concepto {
    type: number
    sql: ${TABLE}.id_Concepto ;;
  }

  dimension: concepto {
    type: string
    sql: ${TABLE}.Concepto ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.SKU ;;
  }


  dimension: periodo_num {
    type: string
    sql: ${TABLE}.PeriodoNum ;;
  }

  dimension: periodo {
    type: string
    sql: ${TABLE}.Periodo ;;
  }

  dimension: cantidad {
    type: number
    sql: ${TABLE}.Cantidad ;;
  }

  set: detail {
    fields: [
      id_concepto,
      concepto,
      sku,
      periodo_num,
      periodo,
      cantidad
    ]
  }
}
