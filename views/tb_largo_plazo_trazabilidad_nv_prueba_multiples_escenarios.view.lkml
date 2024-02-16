
view: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios {
  derived_table: {
    sql: select * from psa-psa-cadena-qa.reporting_ecc_mx.tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios limit 1000 ;;
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

  dimension: escenario_id {
    type: number
    sql: ${TABLE}.Escenario_id ;;
  }

  dimension: tipo_escenario {
    type: string
    sql: ${TABLE}.TipoEscenario ;;
  }

  dimension: id_concepto {
    type: number
    sql: ${TABLE}.id_Concepto ;;
  }

  dimension: orden_concepto {
    type: number
    sql: ${TABLE}.orden_concepto ;;
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
    sql: ${TABLE}.sku ;;
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
        tipomaterial,
	um,
	grupoarticulo,
	grupoarticuloexterno,
	claveidioma,
	articulodescribe,
	escenario_id,
	tipo_escenario,
	id_concepto,
	orden_concepto,
	concepto,
	centro,
	sku,
	periodo_num,
	periodo,
	cantidad
    ]
  }
}
