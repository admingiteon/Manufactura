view: vw_insumos_requeridos_cortex {

  derived_table: {
    sql: SELECT * FROM `eon-bus-proj-cadena-demo.reporting_manufactura.vw_insumos_requeridos_cortex`
    WHERE SUBSTR(material,12,50) LIKE '4%' ;;
    }

  dimension: cantidad_requerida {
    type: number
    sql: ${TABLE}.cantidad_requerida ;;
  }

  measure: total_cantidad_requerida {
    label: "Cantidad Requerida"
    type: sum
    sql: ${cantidad_requerida} ;;  }

  measure: average_cantidad_requerida {
    type: average
    sql: ${cantidad_requerida} ;;  }

  dimension: componente {
    type: string
    sql: SUBSTR(${TABLE}.componente,12,50) ;;
  }

  measure: inventario_inicial {
    type: sum
    sql: ${TABLE}.inventario_inicial ;;
  }

  dimension: material {
    type: string
    sql: SUBSTR(${TABLE}.material,12,50) ;;
  }

  dimension: texto_breve_material {
    label: "Descripción del Insumo"
    type: string
    sql: ${TABLE}.texto_breve_material ;;
  }

  dimension: unidad_medida {
    label: "Unidad de Medida"
    type: string
    sql: ${TABLE}.unidad_medida ;;
  }
  measure: count {
    type: count
  }
}
