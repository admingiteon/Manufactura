
view: tb_largo_plazo_trazabilidad_nv {
  derived_table: {
    sql: SELECT * EXCEPT(Escenario_id), CAST(Escenario_id AS STRING) as escenario_string FROM `eon-bus-proj-cadena-demo.data_foundation.reporting_ecc_mx_tb_largo_plazo_trazabilidad_nv` t
            left join (SELECT material
                             ,CONCAT(SUBSTR(material,12,50), "-" , texto_breve_material)   AS sku_describe
                        FROM `eon-bus-proj-cadena-demo.data_foundation.reporting_homologacion_mx_vw_cadena_suministro_datos_generales`
                       group by texto_breve_material,material) m on m.material=t.SKU
  WHERE {% condition escenario_id %} escenario_string {% endcondition %}
;;


  }

  parameter: Escenario {
    type: number
    default_value: "all"
    allowed_value: {
      label: "0"
      value: "0"
    }
    allowed_value: {
      label: "662"
      value: "662"
    }
     allowed_value: {
      label: "665"
      value: "665"
    }
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

  dimension: escenario_id {
    type: string
    sql: ${TABLE}.escenario_string ;;
  }

  dimension: escenario_str {
    type: string
    sql: ${TABLE}.escenario_string ;;
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


  measure: new_cantidad_total {
    type: number
    drill_fields: [percentage_detail*]
    sql: CASE
      WHEN ${id_concepto} = 14 AND (SUM(${TABLE}.divisor) = 0 OR SUM(${TABLE}.dividendo) = 0) THEN ROUND(SUM(0), 2)
      WHEN ${id_concepto} = 14 AND (SUM(${TABLE}.divisor) >= SUM(${TABLE}.dividendo)) THEN ROUND(AVG(100), 2)
      WHEN ${id_concepto} = 14 AND (SUM(${TABLE}.divisor) < SUM(${TABLE}.dividendo) AND (SUM(${TABLE}.divisor) <> 0 AND SUM(${TABLE}.dividendo) <> 0)) THEN ROUND((SUM(${TABLE}.divisor) / SUM(${TABLE}.dividendo)) * 100, 2)
      WHEN ${id_concepto} = 16 AND (SUM(${TABLE}.divisor) = 0 OR SUM(${TABLE}.dividendo) = 0) THEN ROUND(100-SUM(0), 2)
      WHEN ${id_concepto} = 16 AND (SUM(${TABLE}.divisor) >= SUM(${TABLE}.dividendo)) THEN ROUND(100-AVG(100), 2)
      WHEN ${id_concepto} = 16 AND (SUM(${TABLE}.divisor) < SUM(${TABLE}.dividendo) AND (SUM(${TABLE}.divisor) <> 0 AND SUM(${TABLE}.dividendo) <> 0)) THEN ROUND( 100-((SUM(${TABLE}.divisor) / SUM(${TABLE}.dividendo)) * 100), 2)
      WHEN ${id_concepto} = 4 AND (SUM(${TABLE}.divisor) = 0 OR SUM(${TABLE}.dividendo) = 0) THEN ROUND(SUM(0), 2)
      WHEN ${id_concepto} = 4 AND SUM(${TABLE}.dividendo)<>0 THEN ROUND(AVG(100), 2)
      WHEN ${id_concepto} = 4 AND (SUM(${TABLE}.divisor) <>0 AND SUM(${TABLE}.dividendo) <> 0) THEN ROUND( ((SUM(${TABLE}.dividendo) / SUM(${TABLE}.divisor)) * 100)-100, 2)
      ELSE ROUND(SUM(${TABLE}.Cantidad), 2)
        END;;

    value_format: "#,##0.00"

    html:


    {% if id_concepto._value  ==4 %}
      <p style="color:black;">{{ new_cantidad_total._rendered_value  }}%</p>

    {% elsif (new_cantidad_total._value ==100 or new_cantidad_total._value ==100.00) and id_concepto._value  ==14 %}
      <p style="color: black; background-color: #98FB98;">{{ new_cantidad_total._rendered_value  }}%</p>

    {% elsif (new_cantidad_total._value >=80.00 and new_cantidad_total._value <=99.99) and id_concepto._value  ==14 %}
      <p style="color: black; background-color: #FFD700;">{{ new_cantidad_total._rendered_value  }}%</p>

    {% elsif (new_cantidad_total._value <80.00) and id_concepto._value  ==14 %}
      <p style="color: black; background-color: red;">{{ new_cantidad_total._rendered_value  }}%</p>

    {% elsif (new_cantidad_total._value==0 or new_cantidad_total._value==0.00) and id_concepto._value  ==16 %}
      <p style="color: black; background-color: #98FB98;">{{ new_cantidad_total._rendered_value  }}%</p>

    {% elsif (new_cantidad_total._value >0  and new_cantidad_total._value <=20) and id_concepto._value  ==16 %}
      <p style="color: black; background-color: #FFD700;">{{ new_cantidad_total._rendered_value  }}%</p>

    {% elsif new_cantidad_total._value>20 and id_concepto._value  ==16 %}
      <p style="color: black; background-color: red;">{{ new_cantidad_total._rendered_value  }}%</p>


    {% elsif (id_concepto._value  ==1 or  id_concepto._value  ==2 or id_concepto._value  ==3 or id_concepto._value  ==5 or id_concepto._value  ==6 or id_concepto._value  ==7 or id_concepto._value  ==8  or id_concepto._value  ==9 or id_concepto._value  ==10 or id_concepto._value  ==11 or id_concepto._value  ==12 or id_concepto._value  ==13 or id_concepto._value  ==15 or id_concepto._value  ==17 or id_concepto._value  ==18)%}
      <p style="color: black;">{{ new_cantidad_total._rendered_value  }} U.</p>
    {% endif %}
    ;;


  }



  measure: total_cantidad {
    type: sum
    sql: ${TABLE}.cantidad ;;
    value_format: "#,##0.00"
    drill_fields: [centro,total_cantidad]

    html:
    {% if total_cantidad._value ==1000 and id_concepto._value  ==14 %}
      <p style="color: black; background-color: #98FB98;">{{ total_cantidad._rendered_value  }}%</p>

    {% elsif total_cantidad._value >=800 and total_cantidad._value <=999.99 and id_concepto._value  ==14 %}
      <p style="color: black; background-color: #FFD700;">{{ total_cantidad._rendered_value  }}%</p>

    {% elsif total_cantidad._value <800 and id_concepto._value  ==14 %}
      <p style="color: black; background-color: red;">{{ total_cantidad._rendered_value  }}%</p>

    {% elsif id_concepto._value  ==14 %}
      <p style="color: black;">{{ total_cantidad._rendered_value  }}%</p>

    {% elsif total_cantidad._value ==0 and id_concepto._value  ==16 %}
      <p style="color: black; background-color: #98FB98;">{{ total_cantidad._rendered_value  }}%</p>

    {% elsif total_cantidad._value >0  and total_cantidad._value <=200 and id_concepto._value  ==16 %}
      <p style="color: black; background-color: #FFD700;">{{ total_cantidad._rendered_value  }}%</p>

    {% elsif total_cantidad._value >=200 and  id_concepto._value  ==16 %}
      <p style="color: black; background-color: red;">{{ total_cantidad._rendered_value  }}%</p>

    {% elsif id_concepto._value  ==4 %}
      <p style="color: black;">{{ total_cantidad._rendered_value  }} %</p>

    {% else %}
      <p style="color: black;">{{ total_cantidad._rendered_value  }} U.</p>
    {% endif %}
    ;;

    #{% if   orden_concepto._value  ==4 or orden_concepto._value  ==14 or orden_concepto._value  ==16    %}
    #{% assign indicator = "black,%" | split: ',' %}
    #{% else %}
    #{% assign indicator = "black,U." | split: ',' %}
    #{% endif %}
    #<font color="{{indicator[0]}}">
    #{% if value == 99999.12345 %} &infin
    #{% else %}{{rendered_value}}
    #{% endif %} {{indicator[1]}}
    #</font> ;;

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


  set: percentage_detail {
    fields: [centro,
      cantidad,
      tipomaterial,
      um,
      grupoarticulo,
      grupoarticuloexterno,
      claveidioma,
      articulodescribe,
      escenario_id,
      tipo_escenario,
      id_concepto,
      concepto,
      centro,
      sku,
      periodo_num,
      periodo,
      cantidad
    ]
  }
}
