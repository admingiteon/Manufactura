
view: tb_corto_plazo_plansuministro {
  derived_table: {
    sql: select * from  psa-psa-cadena-qa.reporting_ecc_mx.tb_corto_plazo_plansuministro;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
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
    type: string

    sql: ${TABLE}.dSemana ;;
  }

  dimension: n_pedido {
    type: string
    sql: ${TABLE}.nPedido ;;
  }

  dimension: cantidad {
    type: number
    sql: ${TABLE}.Cantidad ;;
  }

  measure: Total_cantidad {
    type: sum
    sql: ${TABLE}.Cantidad ;;
  }

  dimension: demanda {
    type: number
    sql: ${TABLE}.demanda ;;
  }

  dimension: saldofinal {
    type: number
    sql: ${TABLE}.saldofinal ;;
  }

  measure: total_saldofinal {
    type: sum
    sql: ${TABLE}.saldofinal ;;
  }


  dimension: stockdeseguridad {
    type: number
    sql: ${TABLE}.stockdeseguridad ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }

  dimension: describe_sku {
    type: string
    sql: ${TABLE}.describe_sku ;;
  }

  set: detail {
    fields: [
        id_concepto,
  orden_concepto,
  concepto,
  centro,
  sku,
  grupo_articulos,
  org_ventas,
  mercado,
  cliente,
  clientes_rs,
  d_semana,
  n_pedido,
  cantidad,
  demanda,
  saldofinal,
  stockdeseguridad,
  material,
  describe_sku
    ]
  }
}
