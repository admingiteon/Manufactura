#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines



view: vw_largo_plazo_trazabilidad {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.reporting_ecc_mx.vw_largo_plazo_trazabilidad`
    where sku in ( SELECT sku FROM psa-psa-cadena-qa.reporting_ecc_mx.vw_largo_plazo_trazabilidad
       where id_concepto=1);;
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

  dimension: sku_describe {
    type: string
    sql:concat(SUBSTR(${TABLE}.sku,12,50)  ,'-',  ${TABLE}.articulodescribe) ;;
  }








  dimension: id_concepto {
    type: number
    sql: ${TABLE}.id_Concepto ;;
  }

 dimension: concepto {
  type: string
  sql: ${TABLE}.Concepto ;;

  link: {
    label: "Drill-Down"

    # url: "https://grupoeon.cloud.looker.com/dashboards-next/35"
    # url: "https://grupoeon.cloud.looker.com/dashboards-next/35?Sociedad={{ _filters['Sociedad'] | url_encode }}"

    url:"   {% if value == 'INVENTARIO_INICIAL_(LU+TR)' %}
    https://corpcab.cloud.looker.com/embed/dashboards/54?Concepto=5 &SKU={{ sku._value }}
    {% elsif value=='INVENTARIO_INICIAL_(QM)' %}
    https://corpcab.cloud.looker.com/embed/dashboards/54?Concepto=6 &SKU={{ sku._value }}
    {% elsif value=='STOCK_SEGURIDAD' %}
    https://corpcab.cloud.looker.com/embed/dashboards/54?Concepto=7 &SKU={{ sku._value }}


    {% elsif value=='FABRICACION_CON_BASE_EN_DEMANDA_FALTANTE_E_INVENTARIO_OBJETIVO' %}
    https://corpcab.cloud.looker.com/embed/dashboards/54?Concepto=10 &SKU={{ sku._value }}

     {% elsif value=='PLAN_DEMANDA_CUBIERTO_INVENTARIO_INICIAL' %}
    https://corpcab.cloud.looker.com/embed/dashboards/58?SKU={{ sku._value }}


    {% elsif value=='DEMANDA_NO_CUBIERTA' %}
    https://corpcab.cloud.looker.com/dashboards/28
    {% endif %}"


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
    sql: ${TABLE}.SKU ;;

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
  }

  measure: Total_cantidad {
    type: sum
    sql:  ${TABLE}.Cantidad ;;
    value_format:"#,##0.00;(#,##0)"

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
