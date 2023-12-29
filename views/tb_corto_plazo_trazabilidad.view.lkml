
view: tb_corto_plazo_trazabilidad {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.reporting_ecc_mx.tb_corto_plazo_trazabilidad`  ;;


  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_concepto {
    type: number
    sql: ${TABLE}.id_concepto ;;
  }

  dimension: concepto {
    type: string
    sql: ${TABLE}.concepto ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: describe_sku {
    type: string
    sql: ${TABLE}.describe_sku ;;
  }

  dimension: grupo_articulos {
    type: string
    sql: ${TABLE}.grupo_articulos ;;
  }

  dimension: org_ventas {
    type: string
    sql: ${TABLE}.org_ventas ;;
  }

  dimension: mercado {
    type: string
    sql: ${TABLE}.mercado ;;
  }

  dimension: cliente {
    type: string
    sql: ${TABLE}.cliente ;;
  }

  dimension: clientes_rs {
    type: string
    sql: ${TABLE}.clientes_rs ;;
  }

  dimension: d_semana {
    type: date
    datatype: date
    sql: ${TABLE}.dSemana ;;
  }

  dimension: n_pedido {
    type: string
    sql: ${TABLE}.nPedido ;;
  }

  dimension: cantidad {
    type: number
    sql: ${TABLE}.cantidad ;;
  }


  measure: Total_cantidad {
    type: sum
    sql: ${TABLE}.cantidad ;;
  }

  dimension: demanda {
    type: number
    sql: ${TABLE}.demanda ;;
  }

  dimension: inventaini {
    type: number
    sql: ${TABLE}.inventaini ;;
  }

  dimension: stockdeseguridad {
    type: number
    sql: ${TABLE}.stockdeseguridad ;;
  }

  set: detail {
    fields: [
        id_concepto,
  concepto,
  centro,
  sku,
  describe_sku,
  grupo_articulos,
  org_ventas,
  mercado,
  cliente,
  clientes_rs,
  d_semana,
  n_pedido,
  cantidad,
  demanda,
  inventaini,
  stockdeseguridad
    ]
  }
}
