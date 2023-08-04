#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines



view: vw_largo_plazo_trazabilidad {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.reporting_ecc_mx.vw_largo_plazo_trazabilidad`;;
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

  dimension: id_concepto {
    type: number
    sql: ${TABLE}.id_Concepto ;;
  }

  dimension: concepto {
    type: string
    sql: ${TABLE}.Concepto ;;
   # drill_fields: [vw_lista_componentes.listacomponentes]



    link: {
      label: " Cadena"


      # url: "https://grupoeon.cloud.looker.com/dashboards-next/35"
     # url: "https://grupoeon.cloud.looker.com/dashboards-next/35?Sociedad={{ _filters['Sociedad'] | url_encode }}"


     url:"   {% if value == 'INVENTARIO_INICIAL_(QM)' %}
              https://corpcab.cloud.looker.com/dashboards/27?Concepto={{ value }}&Sku={{ sku._value }}
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
    value_format:"#,##0.00;(#,##0.00)"

  }

  dimension: Detalle_sku {
    type: string
    sql: 'Detalle SKU' ;;


    link: {
      label: " Cadena"
      url:"https://corpcab.cloud.looker.com/dashboards/50?Material={{ _filters['sku'] | url_encode }}"
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
