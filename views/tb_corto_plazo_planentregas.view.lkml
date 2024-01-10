
view: tb_corto_plazo_planentregas {
  derived_table: {
    sql: select * from `psa-psa-cadena-qa.reporting_ecc_mx.tb_corto_plazo_planentregas`  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: Total_Cantidad {
    type: number
    sql: case when  ${TABLE}.id_concepto = 4 then avg(${TABLE}.cantidad) else sum(${TABLE}.cantidad) end ;;
    drill_fields: [detail*]

    value_format: "#,##0"

    html:
    {% if   id_concepto._value  == 4   %}
    {% assign indicator = "black,%" | split: ',' %}
    {% else %}
    {% assign indicator = "black,U" | split: ',' %}
    {% endif %}

      <font color="{{indicator[0]}}">

      {% if value == 99999.12345 %} &infin

      {% else %}{{rendered_value}}

      {% endif %} {{indicator[1]}}

      </font> ;;



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

  dimension: Sku_descripcion {
    type: string
    sql: concat(${TABLE}.SKU,'-',${TABLE}.Describe_sku) ;;
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
