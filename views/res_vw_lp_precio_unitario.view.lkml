
view: res_vw_lp_precio_unitario {
  derived_table: {
    sql: SELECT *  FROM `psa-psa-cadena-qa.quality_data.vw_lp_precio_unitario`  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: solicitante {
    type: string
    sql: ${TABLE}.SOLICITANTE ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.MATERIAL ;;
  }

  dimension: sku {
    type: string
    sql: SUBSTR(${TABLE}.material,12,10) ;;
  }

  dimension: anio {
    type: string
    sql: ${TABLE}.ANIO ;;
  }

  dimension: mes {
    type: string
    sql: ${TABLE}.MES ;;
  }

  dimension: sociedad {
    type: string
    sql: ${TABLE}.SOCIEDAD ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.CENTRO ;;
  }

  dimension: unidad_medida {
    type: string
    sql: ${TABLE}.UnidadMedida ;;
  }

  dimension: matnr {
    type: string
    sql: ${TABLE}.MATNR ;;
  }

  dimension: meinh {
    type: string
    sql: ${TABLE}.MEINH ;;
  }

  dimension: numerador {
    type: number
    sql: ${TABLE}.Numerador ;;
  }

  dimension: denominador {
    type: number
    sql: ${TABLE}.Denominador ;;
  }

  dimension: umb {
    type: number
    sql: ${TABLE}.UMB ;;
  }

  dimension: umbtotales {
    type: number
    sql: ${TABLE}.UMBTotales ;;
  }

  dimension: unidades {
    type: number
    sql: ${TABLE}.Unidades ;;
  }

  dimension: ventas {
    type: number
    sql: ${TABLE}.Ventas ;;
  }

  dimension: precio_unitario {
    type: number
    sql: ${TABLE}.PrecioUnitario ;;
  }

  measure: Total_unidades {
    type: sum
    sql: ${TABLE}.Unidades ;;
    value_format: "#,##0.00"
  }

  measure: Total_ventas {
    type: sum
    sql: ${TABLE}.Ventas ;;
    value_format: "$#,##0.00"
  }

  measure: Total_precio_unitario {
    type: sum
    sql: ${TABLE}.PrecioUnitario ;;
     value_format:"$#.00;($#.00)"
  }


  measure: precio_ponderado {
    type: number
    sql: ${Total_ventas}/${Total_unidades} ;;
    value_format: "$#,##0.00"
  }









  set: detail {
    fields: [
        solicitante,
  material,
  anio,
  mes,
  sociedad,
  centro,
  unidad_medida,
  matnr,
  meinh,
  numerador,
  denominador,
  umb,
  umbtotales,
  unidades,
  ventas,
  precio_unitario
    ]
  }
}
