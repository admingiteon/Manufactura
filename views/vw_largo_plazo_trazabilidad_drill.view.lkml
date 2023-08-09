#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines



view: vw_largo_plazo_trazabilidad_drill {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.reporting_ecc_mx.vw_largo_plazo_trazabilidad_drill` ;;
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

  dimension: drill01 {
    type: string
    sql: ${TABLE}.drill01 ;;
  }

  dimension: drill01describe {
    type: string
    sql: ${TABLE}.drill01describe ;;
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

  measure: Total_cantidad {
    label: "Cantidad"
    type: sum
    sql: ROUND( ${TABLE}.Cantidad,0) ;;
    value_format:"#,##0;(#,##0)"

  }

  set: detail {
    fields: [
      id_concepto,
      concepto,
      sku,
      drill01,
      drill01describe,
      periodo_num,
      periodo,
      cantidad
    ]
  }
}
