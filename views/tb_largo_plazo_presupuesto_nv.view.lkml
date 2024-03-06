
view: tb_largo_plazo_presupuesto_nv {
  derived_table: {
    sql: SELECT * FROM `eon-bus-proj-cadena-demo.data_foundation.reporting_ecc_mx_tb_largo_plazo_presupuesto_nv` t
     left join (SELECT material
                             ,CONCAT(SUBSTR(material,12,50), "-" , texto_breve_material)   AS sku_describe
                        FROM `eon-bus-proj-cadena-demo.data_foundation.reporting_homologacion_mx_vw_cadena_suministro_datos_generales`

                       group by texto_breve_material,material) m on m.material=t.SKU
                        where  id_concepto not in (5,6,7,8)
                      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: sku_unicos {
    type: count_distinct
    sql: ${sku} ;;
  }

  dimension: sku_describe {
    type: string
    sql: ${TABLE}.sku_describe ;;
  }


  measure: Total_cantidad {
    label: "importe Cantidad"
    type: number
    sql: case when ${id_concepto} in (1,2,9,10,11,13,17,18) then sum(${TABLE}.cantidad) else max(${TABLE}.cantidad) end ;;
    value_format:"#,##0;(#,##0)"


    html:
    {% if   id_concepto._value  ==4 or id_concepto._value  ==12 or id_concepto._value  ==14  %}
    {% assign indicator = "black,%" | split: ',' %}
    {% else %}
    {% assign indicator = "black,$" | split: ',' %}
    {% endif %}

      <font color="{{indicator[0]}}">

      {% if   id_concepto._value  ==4 or id_concepto._value  ==12 or id_concepto._value  ==14  %}

      {% if value == 99999.12345 %} &infin
      {% else %}{{rendered_value}}
      {% endif %} {{indicator[1]}}

      {% else %}

      {% if value == 99999.12345 %} &infin
      {% else %} {{indicator[1]}}
      {% endif %} {{rendered_value}}

      {% endif %}


      </font> ;;



  }

  measure: Total_importe_costo {
    label: "importe costo"
    type: sum
    sql: ${TABLE}.costo ;;
    value_format:"#,##0;(#,##0)"
  }

  dimension: escenario_id {
    type: number
    sql: ${TABLE}.Escenario_id ;;
  }

  dimension: tipo_escenario {
    type: string
    sql: ${TABLE}.TipoEscenario ;;
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
    sql: case when  ${TABLE}.grupoarticulo = 'AM' then 'AMSA'
              when  ${TABLE}.grupoarticulo = 'A' then 'Anestesiología y Terapia Intensiva'
              when  ${TABLE}.grupoarticulo = 'T' then 'Antibióticos Intra-Hospitalarios'
              when  ${TABLE}.grupoarticulo = 'O' then 'Antibióticos de Prescripción'
              when ${TABLE}.grupoarticulo = 'L' then 'Control de Infecciones'
              when ${TABLE}.grupoarticulo = 'E' then 'Diálisis Peritoneal'
              when ${TABLE}.grupoarticulo = 'G' then 'Enfermedades Crónicas'
              when ${TABLE}.grupoarticulo = 'K' then 'Farmacéuticos OTC'
              when ${TABLE}.grupoarticulo = 'GP' then 'GENEPISA'
               when ${TABLE}.grupoarticulo = 'J' then 'Hemodiálisis'
      when ${TABLE}.grupoarticulo = 'MI' then 'Maquila Intl.'
      when ${TABLE}.grupoarticulo = 'M' then 'Maquila Nacional'
      when ${TABLE}.grupoarticulo = 'MP' then 'Marca Propia'
      when ${TABLE}.grupoarticulo = 'S' then 'NEUROLOGÍA y PSIQUIATRÍA'
      when ${TABLE}.grupoarticulo = 'F' then 'Nutrición'
      when ${TABLE}.grupoarticulo = 'D' then 'Oftalmología'
      when ${TABLE}.grupoarticulo = 'H' then 'Oncológicos'
      when ${TABLE}.grupoarticulo = 'Q' then 'Pediatría'
      when ${TABLE}.grupoarticulo = 'PMD' then 'Productos Medimix'
      when ${TABLE}.grupoarticulo = 'SM' then 'Salucom'
      when ${TABLE}.grupoarticulo = 'B' then 'Terapia de Infusión'
      when ${TABLE}.grupoarticulo = 'R' then 'Terapia del dolor'
      when ${TABLE}.grupoarticulo = 'N' then 'Transplantes'
      when ${TABLE}.grupoarticulo = 'VDD' then 'Venta Directa Dimesa'
      when ${TABLE}.grupoarticulo = 'U' then 'Genéricos'
      else ${TABLE}.grupoarticulo END  ;;
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
    sql: ${TABLE}.id_concepto ;;
  }

  dimension: concepto {
    type: string
    sql: ${TABLE}.Concepto ;;
  }

  dimension: orden_concepto {
    type: number
    sql: ${TABLE}.orden_concepto ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
  }

  dimension: sku {
    type: string
    sql:  SUBSTR(${TABLE}.sku,12,50)  ;;
  }

  dimension: periodonum {
    type: string
    sql: ${TABLE}.periodonum ;;
  }

  dimension: periodo {
    type: string
    sql: ${TABLE}.periodo ;;
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

  dimension: cant_pz_as {
    type: number
    sql: ${TABLE}.CantPzAs ;;
  }

  set: detail {
    fields: [
        escenario_id,
  tipo_escenario,
  tipomaterial,
  um,
  grupoarticulo,
  grupoarticuloexterno,
  claveidioma,
  articulodescribe,
  id_concepto,
  concepto,
  orden_concepto,
  centro,
  sku,
  periodonum,
  periodo,
  precioventa,
  costo,
  costo_absorbente,
  cantidad,
  cant_pz_as
    ]
  }
}
