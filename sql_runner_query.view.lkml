
view: sql_runner_query {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.reporting_ecc_mx.tb_largo_plazo_presupuesto` LIMIT 10 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: tipomaterial {
    type: string
    sql: ${TABLE}.tipomaterial ;;
  }

  dimension: um {
    type: string
    sql: ${TABLE}.um ;;
  }

  dimension: grupoarticulo {
    type: string
    sql: ${TABLE}.grupoarticulo ;;
  }

  dimension: grupoarticuloexterno {
    type: string
    sql: ${TABLE}.grupoarticuloexterno ;;
  }

  dimension: claveidioma {
    type: string
    sql: ${TABLE}.claveidioma ;;
  }

  dimension: articulodescribe {
    type: string
    sql: ${TABLE}.articulodescribe ;;
  }

  dimension: id_concepto {
    type: number
    sql: ${TABLE}.id_Concepto ;;
  }

  dimension: concepto {
    type: string
    sql: ${TABLE}.Concepto ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
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

  dimension: precioventa {
    type: number
    sql: ${TABLE}.precioventa ;;
  }

  dimension: costo {
    type: number
    sql: ${TABLE}.costo ;;
  }

  dimension: costo_absorbente {
    type: number
    sql: ${TABLE}.costo_absorbente ;;
  }

  dimension: cantidad {
    type: number
    sql: ${TABLE}.cantidad ;;
  }

  set: detail {
    fields: [
        tipomaterial,
	um,
	grupoarticulo,
	grupoarticuloexterno,
	claveidioma,
	articulodescribe,
	id_concepto,
	concepto,
	centro,
	sku,
	periodo_num,
	periodo,
	precioventa,
	costo,
	costo_absorbente,
	cantidad
    ]
  }
}
