
view: res_vw_lp_inventario_insumos {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.quality_data.vw_lp_inventario_insumos` ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: sociedad {
    type: string
    sql: ${TABLE}.sociedad ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }

  dimension: stock_libre_utilizacion {
    type: number
    sql: ${TABLE}.stock_libre_utilizacion ;;
  }

  dimension: stock_seguridad {
    type: number
    sql: ${TABLE}.stock_seguridad ;;
  }

  dimension: insumo_material {
    type: string
    sql: ${TABLE}.Insumo_material ;;
  }

  dimension: insumo_stock_libre_utilizacion {
    type: number
    sql: ${TABLE}.insumo_stock_libre_utilizacion ;;
  }

  dimension: insumo_stock_seguridad {
    type: number
    sql: ${TABLE}.insumo_stock_seguridad ;;
  }

  set: detail {
    fields: [
        sociedad,
  centro,
  material,
  stock_libre_utilizacion,
  stock_seguridad,
  insumo_material,
  insumo_stock_libre_utilizacion,
  insumo_stock_seguridad
    ]
  }
}
