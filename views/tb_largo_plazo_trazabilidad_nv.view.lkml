
view: tb_largo_plazo_trazabilidad_nv {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.reporting_ecc_mx.tb_largo_plazo_trazabilidad_nv` t
            left join (SELECT material
                             ,CONCAT(SUBSTR(material,12,50), "-" , texto_breve_material)   AS sku_describe
                        FROM `psa-sga-dfn-qa.reporting_ecc_mx.vw_cadena_suministro_datos_generales`
                       group by texto_breve_material,material) m on m.material=t.SKU   ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: sku_unicos {
    type: count_distinct
    sql: ${sku} ;;
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
    sql: ${TABLE}.sku_describe ;;
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
    sql:  SUBSTR(${TABLE}.sku,12,50)  ;;
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
