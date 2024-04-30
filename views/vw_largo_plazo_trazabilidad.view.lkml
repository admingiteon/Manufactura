#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines



view: vw_largo_plazo_trazabilidad {
  derived_table: {
    sql: SELECT * FROM `eon-bus-proj-cadena-demo.data_foundation.reporting_ecc_mx_tb_largo_plazo_trazabilidad_nv` where sku in
    (SELECT sku FROM `eon-bus-proj-cadena-demo.data_foundation.reporting_ecc_mx_tb_largo_plazo_trazabilidad_nv` where id_concepto=1)

--    `psa-psa-cadena-qa.reporting_ecc_mx.vw_largo_plazo_trazabilidad`
 --   where sku in ( SELECT sku FROM psa-psa-cadena-qa.reporting_ecc_mx.tb_largo_plazo_trazabilidad where id_concepto=1)
;;
  }

  measure: count {
    type: count

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

  dimension: sku_describe {
    type: string
    sql:concat(SUBSTR(${TABLE}.sku,12,50)  ,'-',  ${TABLE}.articulodescribe) ;;
  }



  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
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
  sql:${TABLE}.Concepto ;;

  link: {
    label: "Drill-Down"

    # url: "https://grupoeon.cloud.looker.com/dashboards-next/35"
    # url: "https://grupoeon.cloud.looker.com/dashboards-next/35?Sociedad={{ _filters['Sociedad'] | url_encode }}"

    url:"   {% if value == 'INVENTARIO_INICIAL_(LU+TR)' %}
    https://corpcab.cloud.looker.com/embed/dashboards/60?Concepto=5 &SKU={{ sku._value }}
    {% elsif value=='INVENTARIO_INICIAL_(QM)' %}
    https://corpcab.cloud.looker.com/embed/dashboards/60?Concepto=6 &SKU={{ sku._value }}
    {% elsif value=='STOCK_SEGURIDAD' %}
    https://corpcab.cloud.looker.com/embed/dashboards/60?Concepto=7 &SKU={{ sku._value }}


    {% elsif value=='FABRICACION_CON_BASE_EN_DEMANDA_FALTANTE_E_INVENTARIO_OBJETIVO' %}
    https://corpcab.cloud.looker.com/embed/dashboards/60?Concepto=10 &SKU={{ sku._value }}

     {% elsif value=='PLAN_DEMANDA_CUBIERTO_INVENTARIO_INICIAL' %}
    https://corpcab.cloud.looker.com/embed/dashboards/58?SKU={{ sku._value }}


    {% elsif value=='DEMANDA_NO_CUBIERTA' %}
    https://corpcab.cloud.looker.com/dashboards/28




    {% endif %}"


  #    {% elsif value=='PLAN_DE_LA_DEMANDA' %}
  #  https://corpcab.cloud.looker.com/embed/dashboards/61?Concepto=1&SKU={{ sku._value }}

  #    {% elsif value=='PLAN_DEMANDA_SIMULADO' %}
  #  https://corpcab.cloud.looker.com/embed/dashboards/61?Concepto=2&SKU={{ sku._value }}

   #   {% elsif value=='VARIACION' %}
  #  https://corpcab.cloud.looker.com/embed/dashboards/61?Concepto=3&SKU={{ sku._value }}

   # {% elsif value=='%' %}
  #  https://corpcab.cloud.looker.com/embed/dashboards/61?Concepto=4&SKU={{ sku._value }}



    #"https://corpcab.cloud.looker.com/dashboards/27?Concepto={{ value }}"
    icon_url: "https://cdn0.iconfinder.com/data/icons/real-estate-111/512/Real_Estate_expanded-14-512.png"
  }



}


  measure: sku_unicos {
    type: count_distinct
    sql: ${sku} ;;
  }

  dimension: sku {
    type: string
     sql: SUBSTR(${TABLE}.sku,12,50) ;;

    link: {
      label: " Informacion Sku"
      url:"https://corpcab.cloud.looker.com/dashboards/50?Material={{ value }}"
      icon_url: "https://cdn0.iconfinder.com/data/icons/real-estate-111/512/Real_Estate_expanded-14-512.png"
    }

  }




  dimension: periodo_num {
    label: "Num Periodo"
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
    value_format:"#,##0;(#,##0)"
  }



  measure: pd {
    type: number
    sql: case when ${orden_concepto}=1 then ${TABLE}.Cantidad else 0 end ;;
  }


  measure: pds {
    type: sum
    sql: case when ${orden_concepto}=2 then ${TABLE}.Cantidad else 0 end ;;
  }


  measure: pdspor {
    type: number
    sql: ${pd}/nullif(${pds},0) ;;
  }






  measure: Total_cantidad {
    label: "Cantidad"
    type: number
    sql: case when ${orden_concepto} in (1,2,3,5,6,7,8,9,10,11,12,13,14,16,18) then sum(${TABLE}.Cantidad)
              when ${orden_concepto} in (4) then sum(${pd})
              when ${orden_concepto} in (15,17) then max(${TABLE}.Cantidad)else  max(${TABLE}.Cantidad) end ;;

    value_format:"#,##0;(#,##0)"

    html:
    {% if   orden_concepto._value  ==4 or   orden_concepto._value  ==15 or  orden_concepto._value  ==17 %}
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

  dimension: Detalle_sku {
    type: string
    sql: 'Detalle SKU' ;;


    link: {
      label: " Informacion Sku"
      url:"https://corpcab.cloud.looker.com/dashboards/50?Material={{ _filters['sku'] | url_encode }}&Grupo+Articulos={{ _filters['grupoarticulo'] | url_encode }}"
      icon_url: "https://cdn0.iconfinder.com/data/icons/real-estate-111/512/Real_Estate_expanded-14-512.png"
    }

  }




  #set: detail {
  #  fields: [
   #   tipomaterial,
  #    um,
  #    grupoarticulo,
  #    grupoarticuloexterno,
  #    claveidioma,
  #    articulodescribe,
  #    id_concepto,
  #    concepto,
  #    sku,

  #    periodo_num,
  #    periodo,
  #    cantidad
  #  ]
 # }
}
