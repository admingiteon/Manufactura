
view: res_vw_lp_productos_terminados {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.quality_data.vw_lp_productos_terminados` ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
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

  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
  }

  dimension: almacen {
    type: string
    sql: ${TABLE}.almacen ;;
  }

  set: detail {
    fields: [
        material,
	stock_libre_utilizacion,
	stock_seguridad,
	centro,
	almacen
    ]
  }
}
