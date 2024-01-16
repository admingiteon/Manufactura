
view: tb_corto_plazo_trazabilidad {
  derived_table: {
    sql:


select * from psa-psa-cadena-qa.reporting_ecc_mx.tb_corto_plazo_trazabilidad
union all
select  1 id_concepto,
        1 orden_concepto,
        'PRONÓSTICO DE PEDIDOS' concepto,
        Centro,
        SKU,
        Describe_sku,
        grupo_articulos,
         org_ventas,
        mercado,
        '' cliente,
        '' clientes_rs,
        '2023-11-04' dSemana,
        nPedido,
        0 cantidad,
        0 demanda,
        0 inventaini,
        0 stockdeseguridad
 from psa-psa-cadena-qa.reporting_ecc_mx.tb_corto_plazo_trazabilidad  where concepto  not in ('1','2') group by
 Centro,
        SKU,
        Describe_sku,
        grupo_articulos,
          Centro,
        SKU,
        Describe_sku,
        grupo_articulos,
        org_ventas,
        mercado,
        nPedido

 union all

 select  2 id_concepto,
         2 orden_concepto,
        'PEDIDOS ABIERTOS' concepto,
        Centro,
        SKU,
        Describe_sku,
        grupo_articulos,
         org_ventas,
        mercado,
        '' cliente,
        '' clientes_rs,
        '2023-11-04' dSemana,
        nPedido,
        0 cantidad,
        0 demanda,
        0 inventaini,
        0 stockdeseguridad
 from psa-psa-cadena-qa.reporting_ecc_mx.tb_corto_plazo_trazabilidad  where concepto  not in ('1','2') group by
 Centro,
        SKU,
        Describe_sku,
        grupo_articulos,
        Centro,
        SKU,
        Describe_sku,
        grupo_articulos,
        org_ventas,
        mercado,
        nPedido





    ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_cantidad {
    type: sum
    sql: ${TABLE}.cantidad ;;
    value_format: "#,##0.00"

    html:
    {% if   id_concepto._value  ==13   %}
    {% assign indicator = "black,%" | split: ',' %}
    {% else %}
    {% assign indicator = "black,U." | split: ',' %}
    {% endif %}

    <font color="{{indicator[0]}}">

    {% if value == 99999.12345 %} &infin

    {% else %}{{rendered_value}}

    {% endif %} {{indicator[1]}}

    </font> ;;

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
    sql: concat(SUBSTR(${TABLE}.sku,12,50);;
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
