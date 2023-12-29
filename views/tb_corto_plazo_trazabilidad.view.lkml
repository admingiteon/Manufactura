
view: tb_corto_plazo_trazabilidad {
  derived_table: {
    sql: select * from psa-psa-cadena-qa.reporting_ecc_mx.tb_corto_plazo_trazabilidad  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_cantidad {
    type: sum
    sql: ${TABLE}.cantidad ;;


    value_format: "#,##0.00"

  }


  dimension: sku_describe {
    type: string
    sql:concat(SUBSTR(${TABLE}.sku,12,50)  ,'-',  ${TABLE}.describe_sku) ;;
  }


  dimension: id_concepto {
    type: number
    sql: ${TABLE}.id_concepto ;;
  }

  dimension: orden_concepto {
    type: number
    sql: ${TABLE}.orden_concepto ;;
  }

  dimension: concepto {
    type: string
    sql: ${TABLE}.concepto ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.Centro ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.SKU ;;
  }

  dimension: describe_sku {
    type: string
    sql: ${TABLE}.Describe_sku ;;
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
    datatype: date
    sql: ${TABLE}.dSemana ;;
  }


  dimension_group: Fecha {
    type: time

    timeframes: [
      raw,
      time,
      hour_of_day,
      date,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year,
      week,
      week_of_year,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    sql: cast(${TABLE}.dSemana AS TIMESTAMP) ;;
    convert_tz: no
  }

  dimension: n_pedido {
    type: string
    sql: ${TABLE}.nPedido ;;
  }

  dimension: cantidad {
    type: number
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
      orden_concepto,
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
