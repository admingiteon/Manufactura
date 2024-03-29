
view: tb_corto_plazo_fabricacion {
  derived_table: {
    sql: select * from `psa-psa-cadena-qa.reporting_ecc_mx.tb_corto_plazo_fabricacion` ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: Total_cantidad {
    type: sum
    sql: nullIF(${TABLE}.Cantidad,0) ;;


    value_format: "#,##0"

    html:
    {% if   id_concepto._value  > 0   %}
    {% assign indicator = "black,U" | split: ',' %}
    {% else %}
    {% assign indicator = "black,U" | split: ',' %}
    {% endif %}

      <font color="{{indicator[0]}}">

      {% if value == 99999.12345 %} &infin

      {% else %}{{rendered_value}}

      {% endif %} {{indicator[1]}}

      </font> ;;



  }

  measure: Total_sku_componente_cantidad {
    type: sum
    sql: ${TABLE}.sku_componente_cantidad ;;


    value_format: "#,##0"

    html:
    {% if   id_concepto._value  > 0   %}
    {% assign indicator = "black,U" | split: ',' %}
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
    sql: SUBSTR(${TABLE}.sku,12,50) ;;
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

  dimension: demanda {
    type: number
    sql: ${TABLE}.demanda ;;
  }

  dimension: saldofinal {
    type: number
    sql: ${TABLE}.saldofinal ;;
  }

  dimension: stockdeseguridad {
    type: number
    sql: ${TABLE}.stockdeseguridad ;;
  }

  dimension: sku_componente_id {
    type: string
    sql: ${TABLE}.sku_Componente_id ;;
  }

  dimension: sku_componente_cantidad {
    type: number
    sql: ${TABLE}.sku_componente_cantidad ;;
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
  saldofinal,
  stockdeseguridad,
  sku_componente_id,
  sku_componente_cantidad
    ]
  }
}
